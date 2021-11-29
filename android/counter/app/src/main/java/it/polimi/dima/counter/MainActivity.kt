package it.polimi.dima.counter

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    private var counter = CounterLogic()
    private var counterTextView: TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main_alt)
        counterTextView = findViewById(R.id.counterTextView)
    }

    fun onZeroClick(view: View){
        counter.zero()
        counterTextView?.text = counter.current.toString()
    }

    fun onAddClick(view: View){
        counter.addOne()
        counterTextView?.text = counter.current.toString()
        // change text view
    }

    fun onTotalClick(view: View){
        val intent = Intent(this, ResultActivity::class.java)
        intent.putExtra(ResultActivity.DATA_KEY, counter.total.toString())
        startActivity(intent)
    }
}