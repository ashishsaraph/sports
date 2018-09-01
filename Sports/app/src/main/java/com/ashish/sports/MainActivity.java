package com.ashish.sports;

import android.app.ProgressDialog;
import android.content.Intent;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.StringRequest;

import app.AppController;


public class MainActivity extends ActionBarActivity {

    private EditText uname,pass;
    private String TAG=MainActivity.class.getSimpleName();
    String URL="";


    // This tag will be used to cancel the request
    private String tag_string_req = "string_req";

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        uname=(EditText)findViewById(R.id.txtUname);
        pass=(EditText)findViewById(R.id.txtPass);
        Button btnLogin=(Button)findViewById(R.id.btnLogin);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String NamePattern = "[a-zA-Z]+";

                if(uname.length()==0)
                {
                    Toast t=Toast.makeText(getApplicationContext(),"User name Field cannot be empty",Toast.LENGTH_SHORT);
                    t.show();
                    return;
                }
                if(pass.length()==0)
                {
                    Toast t=Toast.makeText(getApplicationContext(),"Password Field cannot be empty",Toast.LENGTH_SHORT);
                    t.show();
                    return;
                }
                else if(!uname.getText().toString().matches((NamePattern)))
                {
                    Toast t=Toast.makeText(getApplicationContext(),"Enter Alphabets only in user name",Toast.LENGTH_SHORT);
                    t.show();
                    return;
                }

                else if(uname.length()>25) {
                    Toast t = Toast.makeText(getApplicationContext(), "Please Enter less then 25 Character in User name", Toast.LENGTH_SHORT);
                    t.show();
                    return;
                }

                else
                {
                    URL = MyConstants.loginURL + "?uname=" + uname.getText() + "&pass=" + pass.getText() + "";
                    makeStringReq();
                }

            }
        });
    }
    private void makeStringReq() {
        final ProgressDialog dialog = new ProgressDialog(this); // this = YourActivity
        dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
        dialog.setMessage("Loading. Please wait...");
        dialog.setIndeterminate(true);
        dialog.setCanceledOnTouchOutside(false);
        dialog.show();
//        new android.os.Handler().postDelayed(
//                new Runnable() {
//                    public void run() {
//                        // On complete call either onLoginSuccess or onLoginFailed
//                        //onLoginSuccess();
//                        // onLoginFailed();
//                        dialog.dismiss();
//                    }
//                }, 3000);
        StringRequest strReq = new StringRequest(Request.Method.GET,
                URL, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                Log.d(TAG, response.toString());
                String msgResponse=response.toString();
                String[] parameters=msgResponse.split(";");
                if(parameters[1].equals("true"))
                {
                    // 1. create an intent pass class name or intnet action name
                    Intent intent = new Intent(getApplicationContext(),Eventname.class);
                    // 2. put key/value data
                    intent.putExtra("uname", uname.getText());
                    intent.putExtra("fullname", parameters[0].toString());
                    //start the activity
                    startActivity(intent);
                }
                else {

                    Toast toast = Toast.makeText(getApplicationContext(), "Invalid Login", Toast.LENGTH_SHORT);
                    toast.show();
                    dialog.hide();
                }
            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLog.d(TAG, "Error: " + error.getMessage());
            }
        });

        // Adding request to request queue
        AppController.getInstance().addToRequestQueue(strReq, tag_string_req);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
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
}
