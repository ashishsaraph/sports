package com.ashish.sports;

import android.app.ProgressDialog;
import android.content.Intent;
import android.nfc.Tag;
import android.provider.Settings;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.StringRequest;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import app.AppController;


public class displayresult extends ActionBarActivity {

    private String TAG=displayresult.class.getSimpleName();
    StringBuilder str=new StringBuilder();
    private String tid;
    private String ename,lane;


    String URL="";
    // This tag will be used to cancel the request
    private String tag_string_req = "string_req";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_displayresult);
        Intent intObj=getIntent();

        tid =intObj.getStringExtra("tid");
        ename = intObj.getStringExtra("ename");
        Toast t=Toast.makeText(getApplicationContext(),"tournament ID"+tid+"&Event name "+ename,Toast.LENGTH_LONG);
        t.show();
        lane= intObj.getStringExtra("lane");
        WebView browser = (WebView) findViewById(R.id.webview1);
        browser.getSettings().setJavaScriptEnabled(true);
        ArrayList<String> timing;
        timing = getIntent().getStringArrayListExtra("URL_ARRAY_LIST");
        Object[] score = timing.toArray();
        final String[] result = Arrays.copyOf(score, score.length, String[].class);
        StringBuilder sb = new StringBuilder();
        for(int  i =0; i < result.length; i++)
        {
                sb.append(result[i]);
                sb.append(",");
        }
        String sysid1String = sb.toString();
        Toast.makeText(getApplicationContext(),sysid1String ,Toast.LENGTH_SHORT).show();
        browser.loadUrl("http://www.sahajsolns.com/trackmanagementservice/AddScores.php?tid="+tid+"&eventname="+ename+"&lane="+lane+"&timing="+sysid1String);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_displayresult, menu);
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
            //return true;
            //System.exit(1);
            Intent myIntent = new Intent(displayresult.this, MainActivity.class);
            myIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);// clear back stack
            startActivity(myIntent);
            finish();

        }
        return super.onOptionsItemSelected(item);
    }

}
