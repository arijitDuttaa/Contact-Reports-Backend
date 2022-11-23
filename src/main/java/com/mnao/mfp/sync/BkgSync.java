package com.mnao.mfp.sync;

import java.util.Timer;
import java.util.TimerTask;

import org.springframework.stereotype.Service;

import com.mnao.mfp.common.util.AppConstants;
import com.mnao.mfp.common.util.Utils;

@Service
public class BkgSync<T extends BkgSyncProcessIntf> {
	private T syncProc;
	
	class RunSyncTask implements Runnable {
		@Override
		public void run() {
			syncProc.startSync();
		}
	}

	class TimeOutTask extends TimerTask {
		private Thread thread;
		private Timer timer;

		public TimeOutTask(Thread thread, Timer timer) {
			this.thread = thread;
			this.timer = timer;
		}

		@Override
		public void run() {
			if (thread != null && thread.isAlive()) {
				thread.interrupt();
			}
			timer.cancel();
		}
	}

	public void startSyncProcess(T sProc) {
		long timeoutms = Integer.parseInt(Utils.getAppProperty(AppConstants.DLR_SYNC_TIMEOUT, "0")) * 1000;
		this.syncProc = sProc;
		if (timeoutms > 0) {
			Thread thread = new Thread(new RunSyncTask());
			thread.start();

			Timer timer = new Timer();
			TimeOutTask timeOutTask = new TimeOutTask(thread, timer);
			timer.schedule(timeOutTask, timeoutms);
		}
	}

}
