package nme.installer;


import format.display.MovieClip;
import haxe.Unserializer;
import nme.display.BitmapData;
import nme.media.Sound;
import nme.net.URLRequest;
import nme.text.Font;
import nme.utils.ByteArray;
import ApplicationMain;

#if swf
import format.SWF;
#end

#if xfl
import format.XFL;
#end


/**
 * ...
 * @author Joshua Granick
 */

class Assets {

	
	public static var cachedBitmapData:Hash<BitmapData> = new Hash<BitmapData>();
	#if swf private static var cachedSWFLibraries:Hash <SWF> = new Hash <SWF> (); #end
	#if xfl private static var cachedXFLLibraries:Hash <XFL> = new Hash <XFL> (); #end
	
	private static var initialized:Bool = false;
	private static var libraryTypes:Hash <String> = new Hash <String> ();
	private static var resourceClasses:Hash <Dynamic> = new Hash <Dynamic> ();
	private static var resourceTypes:Hash <String> = new Hash <String> ();
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			resourceClasses.set ("ui/android/fonts/bold.ttf", NME_ui_android_fonts_bold_ttf);
			resourceTypes.set ("ui/android/fonts/bold.ttf", "font");
			resourceClasses.set ("ui/android/fonts/italic.ttf", NME_ui_android_fonts_italic_ttf);
			resourceTypes.set ("ui/android/fonts/italic.ttf", "font");
			resourceClasses.set ("ui/android/fonts/regular.ttf", NME_ui_android_fonts_regular_ttf);
			resourceTypes.set ("ui/android/fonts/regular.ttf", "font");
			resourceClasses.set ("ui/android/img/checkbox.png", NME_ui_android_img_checkbox_png);
			resourceTypes.set ("ui/android/img/checkbox.png", "image");
			resourceClasses.set ("ui/android/img/checkboxChecked.png", NME_ui_android_img_checkboxchecked_png);
			resourceTypes.set ("ui/android/img/checkboxChecked.png", "image");
			resourceClasses.set ("ui/android/img/haxe.png", NME_ui_android_img_haxe_png);
			resourceTypes.set ("ui/android/img/haxe.png", "image");
			resourceClasses.set ("ui/android/img/haxe24.png", NME_ui_android_img_haxe24_png);
			resourceTypes.set ("ui/android/img/haxe24.png", "image");
			resourceClasses.set ("ui/android/img/ico/dark/settings.png", NME_ui_android_img_ico_dark_settings_png);
			resourceTypes.set ("ui/android/img/ico/dark/settings.png", "image");
			resourceClasses.set ("ui/android/img/ico/light/mainBack.png", NME_ui_android_img_ico_light_mainback_png);
			resourceTypes.set ("ui/android/img/ico/light/mainBack.png", "image");
			resourceClasses.set ("ui/android/img/ico/light/mainHome.png", NME_ui_android_img_ico_light_mainhome_png);
			resourceTypes.set ("ui/android/img/ico/light/mainHome.png", "image");
			resourceClasses.set ("ui/android/img/ico/light/mainRecent.png", NME_ui_android_img_ico_light_mainrecent_png);
			resourceTypes.set ("ui/android/img/ico/light/mainRecent.png", "image");
			resourceClasses.set ("ui/android/img/ico/light/next.png", NME_ui_android_img_ico_light_next_png);
			resourceTypes.set ("ui/android/img/ico/light/next.png", "image");
			resourceClasses.set ("ui/android/img/ico/light/settings.png", NME_ui_android_img_ico_light_settings_png);
			resourceTypes.set ("ui/android/img/ico/light/settings.png", "image");
			resourceClasses.set ("ui/android/img/ico/light/star.png", NME_ui_android_img_ico_light_star_png);
			resourceTypes.set ("ui/android/img/ico/light/star.png", "image");
			resourceClasses.set ("ui/android/img/ico/light/thumb.png", NME_ui_android_img_ico_light_thumb_png);
			resourceTypes.set ("ui/android/img/ico/light/thumb.png", "image");
			resourceClasses.set ("ui/android/img/nme.png", NME_ui_android_img_nme_png);
			resourceTypes.set ("ui/android/img/nme.png", "image");
			resourceClasses.set ("ui/android/img/options.png", NME_ui_android_img_options_png);
			resourceTypes.set ("ui/android/img/options.png", "image");
			resourceClasses.set ("ui/android/img/radio.png", NME_ui_android_img_radio_png);
			resourceTypes.set ("ui/android/img/radio.png", "image");
			resourceClasses.set ("ui/android/img/radioChecked.png", NME_ui_android_img_radiochecked_png);
			resourceTypes.set ("ui/android/img/radioChecked.png", "image");
			resourceClasses.set ("ui/android/img/winxp.png", NME_ui_android_img_winxp_png);
			resourceTypes.set ("ui/android/img/winxp.png", "image");
			resourceClasses.set ("Beep", NME_assets_data_beep_mp3);
			resourceTypes.set ("Beep", "sound");
			resourceClasses.set ("assets/alt_tiles.png", NME_assets_alt_tiles_png);
			resourceTypes.set ("assets/alt_tiles.png", "image");
			resourceClasses.set ("assets/auto_tiles.png", NME_assets_auto_tiles_png);
			resourceTypes.set ("assets/auto_tiles.png", "image");
			resourceClasses.set ("assets/data/autotiles.png", NME_assets_data_autotiles_png);
			resourceTypes.set ("assets/data/autotiles.png", "image");
			resourceClasses.set ("assets/data/autotiles_alt.png", NME_assets_data_autotiles_alt_png);
			resourceTypes.set ("assets/data/autotiles_alt.png", "image");
			resourceClasses.set ("assets/data/base.png", NME_assets_data_base_png);
			resourceTypes.set ("assets/data/base.png", "image");
			resourceClasses.set ("assets/data/beep.mp3", NME_assets_data_beep_mp4);
			resourceTypes.set ("assets/data/beep.mp3", "music");
			resourceClasses.set ("assets/data/button.png", NME_assets_data_button_png);
			resourceTypes.set ("assets/data/button.png", "image");
			resourceClasses.set ("assets/data/button_a.png", NME_assets_data_button_a_png);
			resourceTypes.set ("assets/data/button_a.png", "image");
			resourceClasses.set ("assets/data/button_b.png", NME_assets_data_button_b_png);
			resourceTypes.set ("assets/data/button_b.png", "image");
			resourceClasses.set ("assets/data/button_c.png", NME_assets_data_button_c_png);
			resourceTypes.set ("assets/data/button_c.png", "image");
			resourceClasses.set ("assets/data/button_down.png", NME_assets_data_button_down_png);
			resourceTypes.set ("assets/data/button_down.png", "image");
			resourceClasses.set ("assets/data/button_left.png", NME_assets_data_button_left_png);
			resourceTypes.set ("assets/data/button_left.png", "image");
			resourceClasses.set ("assets/data/button_right.png", NME_assets_data_button_right_png);
			resourceTypes.set ("assets/data/button_right.png", "image");
			resourceClasses.set ("assets/data/button_up.png", NME_assets_data_button_up_png);
			resourceTypes.set ("assets/data/button_up.png", "image");
			resourceClasses.set ("assets/data/button_x.png", NME_assets_data_button_x_png);
			resourceTypes.set ("assets/data/button_x.png", "image");
			resourceClasses.set ("assets/data/button_y.png", NME_assets_data_button_y_png);
			resourceTypes.set ("assets/data/button_y.png", "image");
			resourceClasses.set ("assets/data/courier.ttf", NME_assets_data_courier_ttf);
			resourceTypes.set ("assets/data/courier.ttf", "font");
			resourceClasses.set ("assets/data/cursor.png", NME_assets_data_cursor_png);
			resourceTypes.set ("assets/data/cursor.png", "image");
			resourceClasses.set ("assets/data/default.png", NME_assets_data_default_png);
			resourceTypes.set ("assets/data/default.png", "image");
			resourceClasses.set ("assets/data/fontData10pt.png", NME_assets_data_fontdata10pt_png);
			resourceTypes.set ("assets/data/fontData10pt.png", "image");
			resourceClasses.set ("assets/data/fontData11pt.png", NME_assets_data_fontdata11pt_png);
			resourceTypes.set ("assets/data/fontData11pt.png", "image");
			resourceClasses.set ("assets/data/handle.png", NME_assets_data_handle_png);
			resourceTypes.set ("assets/data/handle.png", "image");
			resourceClasses.set ("assets/data/logo.png", NME_assets_data_logo_png);
			resourceTypes.set ("assets/data/logo.png", "image");
			resourceClasses.set ("assets/data/logo_corners.png", NME_assets_data_logo_corners_png);
			resourceTypes.set ("assets/data/logo_corners.png", "image");
			resourceClasses.set ("assets/data/logo_light.png", NME_assets_data_logo_light_png);
			resourceTypes.set ("assets/data/logo_light.png", "image");
			resourceClasses.set ("assets/data/nokiafc22.ttf", NME_assets_data_nokiafc22_ttf);
			resourceTypes.set ("assets/data/nokiafc22.ttf", "font");
			resourceClasses.set ("assets/data/stick.png", NME_assets_data_stick_png);
			resourceTypes.set ("assets/data/stick.png", "image");
			resourceClasses.set ("assets/data/vcr/flixel.png", NME_assets_data_vcr_flixel_png);
			resourceTypes.set ("assets/data/vcr/flixel.png", "image");
			resourceClasses.set ("assets/data/vcr/open.png", NME_assets_data_vcr_open_png);
			resourceTypes.set ("assets/data/vcr/open.png", "image");
			resourceClasses.set ("assets/data/vcr/pause.png", NME_assets_data_vcr_pause_png);
			resourceTypes.set ("assets/data/vcr/pause.png", "image");
			resourceClasses.set ("assets/data/vcr/play.png", NME_assets_data_vcr_play_png);
			resourceTypes.set ("assets/data/vcr/play.png", "image");
			resourceClasses.set ("assets/data/vcr/record_off.png", NME_assets_data_vcr_record_off_png);
			resourceTypes.set ("assets/data/vcr/record_off.png", "image");
			resourceClasses.set ("assets/data/vcr/record_on.png", NME_assets_data_vcr_record_on_png);
			resourceTypes.set ("assets/data/vcr/record_on.png", "image");
			resourceClasses.set ("assets/data/vcr/restart.png", NME_assets_data_vcr_restart_png);
			resourceTypes.set ("assets/data/vcr/restart.png", "image");
			resourceClasses.set ("assets/data/vcr/step.png", NME_assets_data_vcr_step_png);
			resourceTypes.set ("assets/data/vcr/step.png", "image");
			resourceClasses.set ("assets/data/vcr/stop.png", NME_assets_data_vcr_stop_png);
			resourceTypes.set ("assets/data/vcr/stop.png", "image");
			resourceClasses.set ("assets/data/vis/bounds.png", NME_assets_data_vis_bounds_png);
			resourceTypes.set ("assets/data/vis/bounds.png", "image");
			resourceClasses.set ("assets/default_alt.txt", NME_assets_default_alt_txt);
			resourceTypes.set ("assets/default_alt.txt", "text");
			resourceClasses.set ("assets/default_auto.txt", NME_assets_default_auto_txt);
			resourceTypes.set ("assets/default_auto.txt", "text");
			resourceClasses.set ("assets/default_empty.txt", NME_assets_default_empty_txt);
			resourceTypes.set ("assets/default_empty.txt", "text");
			resourceClasses.set ("assets/empty_tiles.png", NME_assets_empty_tiles_png);
			resourceTypes.set ("assets/empty_tiles.png", "image");
			resourceClasses.set ("assets/HaxeFlixel.svg", NME_assets_haxeflixel_svg);
			resourceTypes.set ("assets/HaxeFlixel.svg", "text");
			resourceClasses.set ("assets/img/AgentOrange.ttf", NME_assets_img_agentorange_ttf);
			resourceTypes.set ("assets/img/AgentOrange.ttf", "font");
			resourceClasses.set ("assets/img/blank_pixel.png", NME_assets_img_blank_pixel_png);
			resourceTypes.set ("assets/img/blank_pixel.png", "image");
			resourceClasses.set ("assets/img/test_skin.png", NME_assets_img_test_skin_png);
			resourceTypes.set ("assets/img/test_skin.png", "image");
			resourceClasses.set ("assets/nme.svg", NME_assets_nme_svg);
			resourceTypes.set ("assets/nme.svg", "text");
			resourceClasses.set ("assets/spaceman.png", NME_assets_spaceman_png);
			resourceTypes.set ("assets/spaceman.png", "image");
			resourceClasses.set ("img/AgentOrange.ttf", NME_img_agentorange_ttf);
			resourceTypes.set ("img/AgentOrange.ttf", "font");
			resourceClasses.set ("img/blank_pixel.png", NME_img_blank_pixel_png);
			resourceTypes.set ("img/blank_pixel.png", "image");
			resourceClasses.set ("img/test_skin.png", NME_img_test_skin_png);
			resourceTypes.set ("img/test_skin.png", "image");
			
			
			initialized = true;
			
		}
		
	}
	
	
	public static function getBitmapData (id:String, useCache:Bool = true):BitmapData {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "image") {
			
			if (useCache && cachedBitmapData.exists (id)) {
				
				return cachedBitmapData.get (id);
				
			} else {
				
				var data = cast (Type.createInstance (resourceClasses.get (id), []), BitmapData);
				
				if (useCache) {
					
					cachedBitmapData.set (id, data);
					
				}
				
				return data;
				
			}
			
		} else if (id.indexOf (":") > -1) {
			
			var libraryName = id.substr (0, id.indexOf (":"));
			var symbolName = id.substr (id.indexOf (":") + 1);
			
			if (libraryTypes.exists (libraryName)) {
				
				#if swf
				
				if (libraryTypes.get (libraryName) == "swf") {
					
					if (!cachedSWFLibraries.exists (libraryName)) {
						
						cachedSWFLibraries.set (libraryName, new SWF (getBytes ("libraries/" + libraryName + ".swf")));
						
					}
					
					return cachedSWFLibraries.get (libraryName).getBitmapData (symbolName);
					
				}
				
				#end
				
				#if xfl
				
				if (libraryTypes.get (libraryName) == "xfl") {
					
					if (!cachedXFLLibraries.exists (libraryName)) {
						
						cachedXFLLibraries.set (libraryName, Unserializer.run (getText ("libraries/" + libraryName + "/" + libraryName + ".dat")));
						
					}
					
					return cachedXFLLibraries.get (libraryName).getBitmapData (symbolName);
					
				}
				
				#end
				
			} else {
				
				trace ("[nme.Assets] There is no asset library named \"" + libraryName + "\"");
				
			}
			
		} else {
			
			trace ("[nme.Assets] There is no BitmapData asset with an ID of \"" + id + "\"");
			
		}
		
		return null;
		
	}
	
	
	public static function getBytes (id:String):ByteArray {
		
		initialize ();
		
		if (resourceClasses.exists (id)) {
			
			return Type.createInstance (resourceClasses.get (id), []);
			
		} else {
			
			trace ("[nme.Assets] There is no ByteArray asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getFont (id:String):Font {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "font") {
			
			return cast (Type.createInstance (resourceClasses.get (id), []), Font);
			
		} else {
			
			trace ("[nme.Assets] There is no Font asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getMovieClip (id:String):MovieClip {
		
		initialize ();
		
		var libraryName = id.substr (0, id.indexOf (":"));
		var symbolName = id.substr (id.indexOf (":") + 1);
		
		if (libraryTypes.exists (libraryName)) {
			
			#if swf
			
			if (libraryTypes.get (libraryName) == "swf") {
				
				if (!cachedSWFLibraries.exists (libraryName)) {
					
					cachedSWFLibraries.set (libraryName, new SWF (getBytes ("libraries/" + libraryName + ".swf")));
					
				}
				
				return cachedSWFLibraries.get (libraryName).createMovieClip (symbolName);
				
			}
			
			#end
			
			#if xfl
			
			if (libraryTypes.get (libraryName) == "xfl") {
				
				if (!cachedXFLLibraries.exists (libraryName)) {
					
					cachedXFLLibraries.set (libraryName, Unserializer.run (getText ("libraries/" + libraryName + "/" + libraryName + ".dat")));
					
				}
				
				return cachedXFLLibraries.get (libraryName).createMovieClip (symbolName);
				
			}
			
			#end
			
		} else {
			
			trace ("[nme.Assets] There is no asset library named \"" + libraryName + "\"");
			
		}
		
		return null;
		
	}
	
	
	public static function getSound (id:String):Sound {
		
		initialize ();
		
		if (resourceTypes.exists (id)) {
			
			if (resourceTypes.get (id).toLowerCase () == "sound" || resourceTypes.get (id).toLowerCase () == "music") {
				
				return cast (Type.createInstance (resourceClasses.get (id), []), Sound);
				
			}
			
		}
		
		trace ("[nme.Assets] There is no Sound asset with an ID of \"" + id + "\"");
		
		return null;
		
	}
	
	
	public static function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	//public static function loadBitmapData(id:String, handler:BitmapData -> Void, useCache:Bool = true):BitmapData
	//{
		//return null;
	//}
	//
	//
	//public static function loadBytes(id:String, handler:ByteArray -> Void):ByteArray
	//{	
		//return null;
	//}
	//
	//
	//public static function loadText(id:String, handler:String -> Void):String
	//{
		//return null;
	//}
	
	
}