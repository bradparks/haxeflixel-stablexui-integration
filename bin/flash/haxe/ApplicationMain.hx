#if nme

import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new NMEPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		#if !fdb
		haxe.Log.trace = flashTrace;
		#end
		
		if (call_real)
			begin ();
	}

	#if !fdb
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;
		
        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	#end
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, nme.display.DisplayObject)) {
				nme.Lib.current.addChild(cast instance);
			}	
		}
		
	}

	static function onEnter (_) {
		
		var loaded = nme.Lib.current.loaderInfo.bytesLoaded;
		var total = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="ui/android/fonts/bold.ttf")
			 
			 return Assets.getFont ("ui/android/fonts/bold.ttf");
		 
		
		if (inName=="ui/android/fonts/italic.ttf")
			 
			 return Assets.getFont ("ui/android/fonts/italic.ttf");
		 
		
		if (inName=="ui/android/fonts/regular.ttf")
			 
			 return Assets.getFont ("ui/android/fonts/regular.ttf");
		 
		
		if (inName=="ui/android/img/checkbox.png")
			 
            return Assets.getBitmapData ("ui/android/img/checkbox.png");
         
		
		if (inName=="ui/android/img/checkboxChecked.png")
			 
            return Assets.getBitmapData ("ui/android/img/checkboxChecked.png");
         
		
		if (inName=="ui/android/img/haxe.png")
			 
            return Assets.getBitmapData ("ui/android/img/haxe.png");
         
		
		if (inName=="ui/android/img/haxe24.png")
			 
            return Assets.getBitmapData ("ui/android/img/haxe24.png");
         
		
		if (inName=="ui/android/img/ico/dark/settings.png")
			 
            return Assets.getBitmapData ("ui/android/img/ico/dark/settings.png");
         
		
		if (inName=="ui/android/img/ico/light/mainBack.png")
			 
            return Assets.getBitmapData ("ui/android/img/ico/light/mainBack.png");
         
		
		if (inName=="ui/android/img/ico/light/mainHome.png")
			 
            return Assets.getBitmapData ("ui/android/img/ico/light/mainHome.png");
         
		
		if (inName=="ui/android/img/ico/light/mainRecent.png")
			 
            return Assets.getBitmapData ("ui/android/img/ico/light/mainRecent.png");
         
		
		if (inName=="ui/android/img/ico/light/next.png")
			 
            return Assets.getBitmapData ("ui/android/img/ico/light/next.png");
         
		
		if (inName=="ui/android/img/ico/light/settings.png")
			 
            return Assets.getBitmapData ("ui/android/img/ico/light/settings.png");
         
		
		if (inName=="ui/android/img/ico/light/star.png")
			 
            return Assets.getBitmapData ("ui/android/img/ico/light/star.png");
         
		
		if (inName=="ui/android/img/ico/light/thumb.png")
			 
            return Assets.getBitmapData ("ui/android/img/ico/light/thumb.png");
         
		
		if (inName=="ui/android/img/nme.png")
			 
            return Assets.getBitmapData ("ui/android/img/nme.png");
         
		
		if (inName=="ui/android/img/options.png")
			 
            return Assets.getBitmapData ("ui/android/img/options.png");
         
		
		if (inName=="ui/android/img/radio.png")
			 
            return Assets.getBitmapData ("ui/android/img/radio.png");
         
		
		if (inName=="ui/android/img/radioChecked.png")
			 
            return Assets.getBitmapData ("ui/android/img/radioChecked.png");
         
		
		if (inName=="ui/android/img/winxp.png")
			 
            return Assets.getBitmapData ("ui/android/img/winxp.png");
         
		
		if (inName=="Beep")
			 
            return Assets.getSound ("Beep");
         
		
		if (inName=="assets/alt_tiles.png")
			 
            return Assets.getBitmapData ("assets/alt_tiles.png");
         
		
		if (inName=="assets/auto_tiles.png")
			 
            return Assets.getBitmapData ("assets/auto_tiles.png");
         
		
		if (inName=="assets/data/autotiles.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles.png");
         
		
		if (inName=="assets/data/autotiles_alt.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles_alt.png");
         
		
		if (inName=="assets/data/base.png")
			 
            return Assets.getBitmapData ("assets/data/base.png");
         
		
		if (inName=="assets/data/beep.mp3")
			 
            return Assets.getSound ("assets/data/beep.mp3");
		 
		
		if (inName=="assets/data/button.png")
			 
            return Assets.getBitmapData ("assets/data/button.png");
         
		
		if (inName=="assets/data/button_a.png")
			 
            return Assets.getBitmapData ("assets/data/button_a.png");
         
		
		if (inName=="assets/data/button_b.png")
			 
            return Assets.getBitmapData ("assets/data/button_b.png");
         
		
		if (inName=="assets/data/button_c.png")
			 
            return Assets.getBitmapData ("assets/data/button_c.png");
         
		
		if (inName=="assets/data/button_down.png")
			 
            return Assets.getBitmapData ("assets/data/button_down.png");
         
		
		if (inName=="assets/data/button_left.png")
			 
            return Assets.getBitmapData ("assets/data/button_left.png");
         
		
		if (inName=="assets/data/button_right.png")
			 
            return Assets.getBitmapData ("assets/data/button_right.png");
         
		
		if (inName=="assets/data/button_up.png")
			 
            return Assets.getBitmapData ("assets/data/button_up.png");
         
		
		if (inName=="assets/data/button_x.png")
			 
            return Assets.getBitmapData ("assets/data/button_x.png");
         
		
		if (inName=="assets/data/button_y.png")
			 
            return Assets.getBitmapData ("assets/data/button_y.png");
         
		
		if (inName=="assets/data/courier.ttf")
			 
			 return Assets.getFont ("assets/data/courier.ttf");
		 
		
		if (inName=="assets/data/cursor.png")
			 
            return Assets.getBitmapData ("assets/data/cursor.png");
         
		
		if (inName=="assets/data/default.png")
			 
            return Assets.getBitmapData ("assets/data/default.png");
         
		
		if (inName=="assets/data/fontData10pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData10pt.png");
         
		
		if (inName=="assets/data/fontData11pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData11pt.png");
         
		
		if (inName=="assets/data/handle.png")
			 
            return Assets.getBitmapData ("assets/data/handle.png");
         
		
		if (inName=="assets/data/logo.png")
			 
            return Assets.getBitmapData ("assets/data/logo.png");
         
		
		if (inName=="assets/data/logo_corners.png")
			 
            return Assets.getBitmapData ("assets/data/logo_corners.png");
         
		
		if (inName=="assets/data/logo_light.png")
			 
            return Assets.getBitmapData ("assets/data/logo_light.png");
         
		
		if (inName=="assets/data/nokiafc22.ttf")
			 
			 return Assets.getFont ("assets/data/nokiafc22.ttf");
		 
		
		if (inName=="assets/data/stick.png")
			 
            return Assets.getBitmapData ("assets/data/stick.png");
         
		
		if (inName=="assets/data/vcr/flixel.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/flixel.png");
         
		
		if (inName=="assets/data/vcr/open.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/open.png");
         
		
		if (inName=="assets/data/vcr/pause.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/pause.png");
         
		
		if (inName=="assets/data/vcr/play.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/play.png");
         
		
		if (inName=="assets/data/vcr/record_off.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_off.png");
         
		
		if (inName=="assets/data/vcr/record_on.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_on.png");
         
		
		if (inName=="assets/data/vcr/restart.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/restart.png");
         
		
		if (inName=="assets/data/vcr/step.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/step.png");
         
		
		if (inName=="assets/data/vcr/stop.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/stop.png");
         
		
		if (inName=="assets/data/vis/bounds.png")
			 
            return Assets.getBitmapData ("assets/data/vis/bounds.png");
         
		
		if (inName=="assets/default_alt.txt")
			 
			 return Assets.getText ("assets/default_alt.txt");
         
		
		if (inName=="assets/default_auto.txt")
			 
			 return Assets.getText ("assets/default_auto.txt");
         
		
		if (inName=="assets/default_empty.txt")
			 
			 return Assets.getText ("assets/default_empty.txt");
         
		
		if (inName=="assets/empty_tiles.png")
			 
            return Assets.getBitmapData ("assets/empty_tiles.png");
         
		
		if (inName=="assets/HaxeFlixel.svg")
			 
			 return Assets.getText ("assets/HaxeFlixel.svg");
         
		
		if (inName=="assets/img/AgentOrange.ttf")
			 
			 return Assets.getFont ("assets/img/AgentOrange.ttf");
		 
		
		if (inName=="assets/img/blank_pixel.png")
			 
            return Assets.getBitmapData ("assets/img/blank_pixel.png");
         
		
		if (inName=="assets/img/test_skin.png")
			 
            return Assets.getBitmapData ("assets/img/test_skin.png");
         
		
		if (inName=="assets/nme.svg")
			 
			 return Assets.getText ("assets/nme.svg");
         
		
		if (inName=="assets/spaceman.png")
			 
            return Assets.getBitmapData ("assets/spaceman.png");
         
		
		if (inName=="img/AgentOrange.ttf")
			 
			 return Assets.getFont ("img/AgentOrange.ttf");
		 
		
		if (inName=="img/blank_pixel.png")
			 
            return Assets.getBitmapData ("img/blank_pixel.png");
         
		
		if (inName=="img/test_skin.png")
			 
            return Assets.getBitmapData ("img/test_skin.png");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}

class NME_ui_android_fonts_bold_ttf extends nme.text.Font { }
class NME_ui_android_fonts_italic_ttf extends nme.text.Font { }
class NME_ui_android_fonts_regular_ttf extends nme.text.Font { }
class NME_ui_android_img_checkbox_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_checkboxchecked_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_haxe_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_haxe24_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_ico_dark_settings_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_ico_light_mainback_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_ico_light_mainhome_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_ico_light_mainrecent_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_ico_light_next_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_ico_light_settings_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_ico_light_star_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_ico_light_thumb_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_nme_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_options_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_radio_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_radiochecked_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_ui_android_img_winxp_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_beep_mp3 extends nme.media.Sound { }
class NME_assets_alt_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_auto_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_alt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_base_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_beep_mp4 extends nme.media.Sound { }
class NME_assets_data_button_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_a_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_b_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_c_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_left_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_right_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_x_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_y_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_courier_ttf extends nme.text.Font { }
class NME_assets_data_cursor_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_default_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata10pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata11pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_handle_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_corners_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_light_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_nokiafc22_ttf extends nme.text.Font { }
class NME_assets_data_stick_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_flixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_open_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_pause_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_play_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_off_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_on_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_restart_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_step_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_stop_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vis_bounds_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_default_alt_txt extends nme.utils.ByteArray { }
class NME_assets_default_auto_txt extends nme.utils.ByteArray { }
class NME_assets_default_empty_txt extends nme.utils.ByteArray { }
class NME_assets_empty_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_haxeflixel_svg extends nme.utils.ByteArray { }
class NME_assets_img_agentorange_ttf extends nme.text.Font { }
class NME_assets_img_blank_pixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_test_skin_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_nme_svg extends nme.utils.ByteArray { }
class NME_assets_spaceman_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_img_agentorange_ttf extends nme.text.Font { }
class NME_img_blank_pixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_img_test_skin_png extends nme.display.BitmapData { public function new () { super (0, 0); } }


#else

import Main;

class ApplicationMain {
	
	public static function main () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
		
	}

}

#end
