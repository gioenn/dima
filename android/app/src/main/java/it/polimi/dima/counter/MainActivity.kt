package it.polimi.dima.counter

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    private var counter = 0
    private var counterTextView: TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        counterTextView = findViewById(R.id.counterTextView)
    }

    fun onAddClick(view: View){
        counter += 1
        counterTextView?.text = counter.toString()
        // change text view
    }
}