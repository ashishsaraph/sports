package com.ashish.sports;

import android.content.Intent;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;


public class Player_details extends ActionBarActivity {

    public String tid,ename,lane;
    public WebView browser;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_player_details);
        Intent intObj=getIntent();
        tid =intObj.getStringExtra("tournament");
        ename = intObj.getStringExtra("eventname");
        lane= intObj.getStringExtra("lane");
        WebView browser = (WebView) findViewById(R.id.webview1);
        browser.getSettings().setJavaScriptEnabled(true);
        browser.loadUrl("http://www.sahajsolns.com/trackmanagementservice/getParticipants.php?tid="+tid+"&eventname="+ename);
       // Toast.makeText(getApplicationContext(),"http://www.sahajsolns.com/trackmanagementservice/getParticipants.php?tid="+tid+"&eventname="+ename,Toast.LENGTH_LONG).show();

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_player_details, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
