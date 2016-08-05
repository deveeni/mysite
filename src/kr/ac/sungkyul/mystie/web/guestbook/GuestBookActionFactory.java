package kr.ac.sungkyul.mystie.web.guestbook;

import kr.ac.sungkyul.web.Action;
import kr.ac.sungkyul.web.ActionFactory;

public class GuestBookActionFactory extends ActionFactory {

	@Override
	public Action getAction(String actionName) {
		Action action = null;
		
		if("guestbookform".equals(actionName)){
			action = new GuestBookFormAction();	
		}else if("insert".equals(actionName)){
			action = new GuestBookInsertAction();
		}else if("delete".equals(actionName)){
			
		}else{
			
		}
		
		return action;
	}

}
