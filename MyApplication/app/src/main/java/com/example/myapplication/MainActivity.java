package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
/*加入textview*/
import android.widget.TextView;

import com.sun.jna.Callback;
import com.sun.jna.Library;
import com.sun.jna.Native;
import com.sun.jna.Pointer;
import com.sun.jna.Structure;

import java.util.Arrays;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        String log_str = "log:";
        TextView tv = findViewById(R.id.tv);  //获取id
        tv.setText(log_str);

        System.out.println("start jna");
        int c = mydll.INSTANCE.add(55, 77);
        System.out.println("result =" +  c);
        log_str = tv.getText()+"result ="+String.valueOf(c);
        tv.setText(log_str);
    }
    public interface mydll extends Library{
        mydll INSTANCE = (mydll) Native.loadLibrary(
                "protocol"
                , mydll.class);
        int add(int i,int j);
    }

}