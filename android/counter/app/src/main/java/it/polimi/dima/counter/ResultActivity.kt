package it.polimi.dima.counter

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class ResultActivity : AppCompatActivity() {

    companion object {
        const val DATA_KEY = "RESULT_ACTIVITY_DATA_KEY"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_result)
        val textView: TextView = findViewById(R.id.resultTextView)
        val data = intent.getStringExtra(DATA_KEY)
        textView.text = data
    }
}