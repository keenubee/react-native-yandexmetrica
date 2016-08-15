package com.reactnativeyandexmetrica;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.yandex.metrica.YandexMetrica;


public class YandexMetricaModule extends ReactContextBaseJavaModule {

	public static String TAG = YandexMetricaModule.class.getName();

    public YandexMetricaModule(ReactApplicationContext reactContext) {
        super(reactContext);

    }

    @Override
    public String getName() {
        return "YandexMetrica";
    }

    @ReactMethod
    public void reportEvent(String message, final Callback callback) {
		try {
			YandexMetrica.reportEvent(message);
			callback.invoke(null, "success");
		}
		catch (Exception ex) {
			callback.invoke(ex.getMessage(), null);
		}
	}
}