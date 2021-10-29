import com.vuzix.sdk.speechrecognitionservice.VuzixSpeechClient;

Activity myActivity = this;
        VuzixSpeechClient sc = new VuzixSpeechClient(myActivity);

// Surround the creation of the VuzixSpeechClient with a try/catch for non-Vuzix hardware
        VuzixSpeechClient sc;
        try {
        sc = new VuzixSpeechClient(myActivity);
        } catch(RuntimeException e) {
        if(e.getMessage().equals("Stub!")) {
        // This is not being run on Vuzix hardware (or the Proguard rules are incorrect)
        // Alert the user, or insert recovery here.
        } else {
        // Other RuntimeException to be handled
        }
        }

// Surround all speech client commands with try/catch
        try {
        // sc.anySdkCommandHere();
        } catch(NoClassDefFoundError e) {
        // The hardware does not support the specific command expected by the Vuzix Speech SDK.
        // Alert the user, or insert recovery here.
        }


public class VoiceCmdReceiver  extends BroadcastReceiver {
    public final String CUSTOM_SDK_INTENT = "com.your_company.CustomIntent";
    final String CUSTOM_EVENT = "om";

    public VoiceCmdReceiver(MainActivity iActivity) {
        iActivity.registerReceiver(this, new IntentFilter(CUSTOM_SDK_INTENT);
        VuzixSpeechClient sc = new VuzixSpeechClient(iActivity);

        Intent customSdkIntent = new Intent(mMainActivity.CUSTOM_SDK_INTENT);
        sc.defineIntent(CUSTOM_EVENT, customSdkIntent );
        // strings.xml contains: <string name="spoken_phrase_testing">testing my voice application</string>
        sc.insertIntentPhrase( iActivity.getResources().getString(R.string.spoken_phrase_testing), CUSTOM_EVENT);

        Log.i( LOG_TAG, sc.dump() );
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        // Since we only registered one phrase to this intent, we don't need any further switching. We know we got our CUSTOM_EVENT
        // todo: add test behavior
        print("success");
    }

}