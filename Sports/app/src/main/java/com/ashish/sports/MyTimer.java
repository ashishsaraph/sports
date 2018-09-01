package com.ashish.sports;

import android.content.Intent;
import android.os.Handler;
import android.os.SystemClock;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;


public class MyTimer extends ActionBarActivity {

    public Button btnStart;
    public Button btnStop;
    public TextView timerValue;
    public TextView timeLabel;
    public Button btnSubmit;
    public static final String EXTRA_NAME="com.ashish.sports.timerValue";

    private long startTime = 0L;
    private Handler customHandler = new Handler();
    long timeInMilliseconds = 0L;
    long timeSwapBuff = 0L;
    long updatedTime = 0L;
    ArrayList<String> myarray=new ArrayList<String>();
    int counter=0;
    public String tournament;
    public String eventname,lane;
    public String counter1;
    public int cnt;
    public Intent in;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_timer);
        in=getIntent();
        counter1=in.getStringExtra("lane");
        cnt=Integer.parseInt(counter1);
        Button btnReset = (Button) findViewById(R.id.btnReset);
        timeLabel = (TextView) findViewById(R.id.timeLabel);
        timerValue = (TextView) findViewById(R.id.timerValue);
        btnStart = (Button) findViewById(R.id.btnStart);
        btnStop = (Button) findViewById(R.id.btnStop);
        btnStop.setEnabled(false);
        btnSubmit=(Button)findViewById(R.id.btnSubmit);
        btnSubmit.setEnabled(false);
        btnStart.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                timerValue.removeCallbacks(updateTimerThread);
                btnStart.setEnabled(false);
                startTime = SystemClock.uptimeMillis();
                customHandler.postDelayed(updateTimerThread, 0);
                btnStop.setEnabled(true);
            }
        });
        btnReset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                timerValue.setText("" + 0 + ":" + String.format("%02d", 0) + ":" + String.format("%03d", 0));
                customHandler.removeCallbacks(updateTimerThread);
                startTime = 0L;
                timeInMilliseconds = 0L;
                timeSwapBuff = 0L;
                updatedTime = 0L;
                counter=0;
                myarray.clear();
                btnStart.setEnabled(true);
                btnSubmit.setEnabled(false);
            }
        });
        btnSubmit.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                tournament = in.getStringExtra("tournament");
                eventname = in.getStringExtra("eventname");
                lane = in.getStringExtra("lane");
                Bundle b = new Bundle();
                b.putStringArrayList("URL_ARRAY_LIST",myarray);
                Intent intObj=new Intent(MyTimer.this,displayresult.class);
                intObj.putExtras(b);
                intObj.putExtra(EXTRA_NAME,myarray);
//                intObj.putExtra("tournament",getIntent().getExtras().getString("tournament"));
//                intObj.putExtra("eventname",getIntent().getExtras().getString("eventname"));
                //StartActivity
                intObj.putExtra("tid",tournament);
                intObj.putExtra("ename",eventname);
                intObj.putExtra("lane",lane);
                startActivity(intObj);
            }
        });

        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                btnStart.setEnabled(false);
                timeSwapBuff += timeInMilliseconds;
                Log.e("SSS",""+timeSwapBuff);
                customHandler.removeCallbacks(updateTimerThread);
                timeInMilliseconds = SystemClock.uptimeMillis() - startTime;

                updatedTime = timeSwapBuff ;

                if(counter<cnt) {

                    int secs = (int) (updatedTime / 1000);
                    int mins = secs / 60;
                    secs = secs % 60;
                    int milliseconds = (int) (updatedTime % 1000);
                    myarray.add(timerValue.getText().toString());
                    counter++;
                    startTime = SystemClock.uptimeMillis();
                    customHandler.postDelayed(updateTimerThread, 0);
                    //timeLabel.setText(String.format("%d",timeSwapBuff));
                    timeLabel.setText("" + mins + ":" + String.format("%02d", secs) + ":" + String.format("%03d", milliseconds));
                }

                else
                {
                    btnSubmit.setEnabled(true);
                    Toast t=Toast.makeText(getApplicationContext(),"Cannot click More than " +cnt+" time",Toast.LENGTH_SHORT);
                    t.show();
                    timerValue.setText("00:00:00");
                    customHandler.removeCallbacks(updateTimerThread);
                    startTime = 0L;
                    timeInMilliseconds = 0L;
                    timeSwapBuff = 0L;
                    updatedTime = 0L;
                    btnStart.setEnabled(false);
                    btnStop.setEnabled(false);
                }

            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_my_timer, menu);
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
            System.exit(1);
            //return true;
        }

        return super.onOptionsItemSelected(item);
    }

    private Runnable updateTimerThread = new Runnable() {

        public void run() {

            timeInMilliseconds = SystemClock.uptimeMillis() - startTime;

            updatedTime = timeSwapBuff + timeInMilliseconds;

            int secs = (int) (updatedTime / 1000);
            int mins = secs / 60;
            secs = secs % 60;
            int milliseconds = (int) (updatedTime % 1000);
            timerValue.setText("" + mins + ":"
                    + String.format("%02d", secs) + ":"
                    + String.format("%03d", milliseconds));
            customHandler.postDelayed(this, 0);
        }

    };

   @Override
    public void onBackPressed(){

   }
}
