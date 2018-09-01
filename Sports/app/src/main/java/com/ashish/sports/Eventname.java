package com.ashish.sports;

import android.content.Intent;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Toast;

import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonArrayRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import app.AppController;


public class Eventname extends ActionBarActivity {

    public Button btnsubmit;
    public Button btnview;
    private Spinner spinner1,spinner2,spinner3;
    //URL for request
    private String URL="";

    // This tag will be used to cancel the request
    private String tag_string_req = "string_req";

    //TAG for recording LOG records
    private String TAG=MainActivity.class.getSimpleName();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_eventname);

        btnsubmit = (Button) findViewById(R.id.btnSubmit);
        btnview = (Button) findViewById(R.id.btnView);
        spinner1=(Spinner) findViewById(R.id.tournament);
        spinner2=(Spinner) findViewById(R.id.spinner1);
        spinner3=(Spinner) findViewById(R.id.lane);

        //call the make JSON array Request
        URL=MyConstants.eventnameURL;
        makeJsonArrayRequest();

        btnsubmit.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                Intent intObj=new Intent(Eventname.this,MyTimer.class);
                intObj.putExtra("tournament",  spinner1.getSelectedItem().toString());
                intObj.putExtra("eventname",spinner2.getSelectedItem().toString());
                intObj.putExtra("lane",spinner3.getSelectedItem().toString());
                startActivity(intObj);

            }
        });
        btnview.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                Intent intObj=new Intent(Eventname.this,Player_details.class);
                intObj.putExtra("tournament",  spinner1.getSelectedItem().toString());
                intObj.putExtra("eventname",spinner2.getSelectedItem().toString());
                intObj.putExtra("lane",spinner3.getSelectedItem().toString());
                startActivity(intObj);

            }
        });
    }

    /**
     * Method to make json array request where response starts with [
     * */
    private void makeJsonArrayRequest() {
        // showpDialog();
        //Toast.makeText(getApplicationContext(),"Json request to be made",Toast.LENGTH_LONG).show();
        JsonArrayRequest req = new JsonArrayRequest(URL,
                new Response.Listener<JSONArray>(){
                    @Override
                    public void onResponse(JSONArray response) {
                        Log.d(TAG, response.toString());
                        //Toast.makeText(getApplicationContext(),"Json request made",Toast.LENGTH_LONG).show();
                        try {
                            // Parsing json array response

                            //declare a arraylist to store the json array response
                            //to store the question list
                            List<String> topicList = new ArrayList<String>();

                            // loop through each json object
                            for (int i = 0; i < response.length(); i++)
                            {
                                //GET THE RESPONSE IN AN OBJECT
                                JSONObject mytopics = (JSONObject) response.get(i);
                                //ADD THE DATA TO THE VARIABELS OF OBJECT
                                topicList.add(mytopics.getString("tid"));

                            }
                            // Creating adapter for spinner
                            ArrayAdapter<String> dataAdapter =new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_spinner_item, topicList);

                            // Drop down layout style - list view with radio button
                            dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

                            // attaching data adapter to spinner
                            spinner1.setAdapter(dataAdapter);

                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(getApplicationContext(),
                                    "Error: " + e.getMessage(),
                                    Toast.LENGTH_LONG).show();
                        }

                        //hidepDialog();
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLog.d(TAG, "Error: " + error.getMessage());
                Toast.makeText(getApplicationContext(),
                        error.getMessage(), Toast.LENGTH_SHORT).show();
                // hidepDialog();
            }
        });
        // Adding request to request queue
        AppController.getInstance().addToRequestQueue(req);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_eventname, menu);
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
            System.exit(1);
        }

        return super.onOptionsItemSelected(item);
    }
    public void onBackPressed(){

    }
}
