package it.polimi.dima.countercompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.sp
import it.polimi.dima.countercompose.ui.theme.CounterComposeTheme

class ResultActivity : ComponentActivity() {

    companion object {
        const val EXTRA_KEY = "RESULT_ACTIVITY_KEY"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CounterComposeTheme {
                // A surface container using the 'background' color from the theme
                Surface(color = MaterialTheme.colors.background) {
                    Result(intent.getIntExtra(EXTRA_KEY, 0))
                }
            }
        }
    }
}

@Composable
fun Result(value: Int) {
   Column(
       modifier = Modifier.fillMaxSize(),
       verticalArrangement = Arrangement.Center,
       horizontalAlignment = Alignment.CenterHorizontally
   ){
       Text("$value", fontSize = 30.sp)
   }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview2() {
    CounterComposeTheme {
        Result(10)
    }
}