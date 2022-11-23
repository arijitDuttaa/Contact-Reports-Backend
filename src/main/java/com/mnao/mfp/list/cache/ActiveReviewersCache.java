package com.mnao.mfp.list.cache;

import java.text.ParseException;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.mnao.mfp.common.controller.MfpKPIControllerBase;
import com.mnao.mfp.common.dao.DealerFilter;
import com.mnao.mfp.common.util.AppConstants;
import com.mnao.mfp.cr.dto.RegionZoneReviewer;
import com.mnao.mfp.list.dao.ListPersonnel;
import com.mnao.mfp.list.service.MMAListService;
import com.mnao.mfp.sync.BkgSync;
import com.mnao.mfp.sync.BkgSyncProcessIntf;
import com.mnao.mfp.user.dao.MFPUser;

//
@Service
public class ActiveReviewersCache extends MfpKPIControllerBase implements BkgSyncProcessIntf {
	//
	private static final Logger log = LoggerFactory.getLogger(ActiveReviewersCache.class);
	//
	@Value("${reviewer.cache.refresh.period.minutes}")
	private Integer reviewPeriod;
	//
	@Autowired
	private BkgSync<ActiveReviewersCache> backgroundRefresh;
	//
	private final List<ListPersonnel> activeReviewersList = new ArrayList<>();
	private final Map<String, RegionZoneReviewer> reviewersByRgnZone = new HashMap<>();
	private Instant lastRefreshed = null;
	private MFPUser mfpUser;

	//
	@Override
	public void startSync() {
		List<ListPersonnel> retRows = getListOfAllReviewers();
		refreshCache(retRows);
		lastRefreshed = Instant.now();
	}

	//
	@PostConstruct
	public void init() {
		if (reviewPeriod == null)
			reviewPeriod = 1;
		startSync();
	}

	//
	public List<ListPersonnel> getAllActiveReviewers(MFPUser mfpUser) {
		List<ListPersonnel> retRows = activeReviewersList;
		this.mfpUser = mfpUser;
		Instant now = Instant.now();
		if (lastRefreshed == null || activeReviewersList.size() == 0) {
			startSync();
			retRows = activeReviewersList;
		} else if (Duration.between(lastRefreshed, now).toMinutes() > reviewPeriod) {
			backgroundRefresh.startSyncProcess(this);
		}
		return retRows;
	}

	//
	public Map<String, RegionZoneReviewer> getRegionZoneReviewers(MFPUser mfpUser) {
		this.mfpUser = mfpUser;
		Map<String, RegionZoneReviewer> retReviewers = reviewersByRgnZone;
		if (reviewersByRgnZone.size() == 0) {
			startSync();
			retReviewers = reviewersByRgnZone;
		} else if (Duration.between(lastRefreshed, Instant.now()).abs().toMinutes() > reviewPeriod) {
			backgroundRefresh.startSyncProcess(this);
		}
		return retReviewers;
	}

	//
	private void refreshCache(List<ListPersonnel> retRows) {
		activeReviewersList.clear();
		activeReviewersList.addAll(retRows);
		setReviewersByRgnZone();
	}

	private List<ListPersonnel> getListOfAllReviewers() {
		MMAListService<ListPersonnel> service = new MMAListService<ListPersonnel>();
		String sqlName = getKPIQueryFilePath(AppConstants.SQL_LIST_REVIEWER_EMPLOYEES_ALL);
		DealerFilter df = new DealerFilter(this.mfpUser, null, null, null, null, null);
		List<ListPersonnel> retRows = null;
		Instant start = Instant.now();
		try {
			retRows = service.getListData(sqlName, ListPersonnel.class, df);
			log.info("Retrieved {} Reviewers in {} ms.", retRows.size(),
					Duration.between(start, Instant.now()).toMillis());
		} catch (InstantiationException | IllegalAccessException | ParseException e) {
			log.error("ERROR retrieving list of ALL Reviewers:", e);
		}
		return retRows;
	}

	private void setReviewersByRgnZone() {
		Map<String, RegionZoneReviewer> allReviewers = new HashMap<>();
		for (ListPersonnel lp : activeReviewersList) {
			RegionZoneReviewer rzr = new RegionZoneReviewer(lp.getRgnCd(), lp.getZoneCd(), null);
			RegionZoneReviewer allRrzr = allReviewers.get(rzr.getRegionZone());
			if (allRrzr != null) {
				allRrzr.getReviewers().add(lp);
			} else {
				List<ListPersonnel> lstRzr = new ArrayList<>();
				lstRzr.add(lp);
				rzr = new RegionZoneReviewer(lp.getRgnCd(), lp.getZoneCd(), lstRzr);
				allReviewers.put(rzr.getRegionZone(), rzr);
			}
		}
		reviewersByRgnZone.clear();
		reviewersByRgnZone.putAll(allReviewers);
	}

}
