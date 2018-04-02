package kr.co.gotthem.scheduler;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.gotthem.basket.service.BasketService;

@Component
public class Scheduler {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private BasketService basketService;

	@Scheduled(cron = "01 01 09 * * ?")
	public void HofScheduler() {
		try {
			int a = 1;
			basketService.deleteBasketAll(a);
			System.out.println("오전 09:01:01,장바구니 전체삭제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
