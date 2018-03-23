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

    @Scheduled(cron="01 01 10 * * ?")
   /* @Scheduled(cron="01 01 03 * * ?")*/
    public void HofScheduler() {
        try{
        	int a = 1;
        	System.out.println("오후 03:01:01에 호출이 됩니다 ");
        	basketService.deleteBasketAll(a);
        	System.out.println("전체삭제 실행");
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
} 
    
