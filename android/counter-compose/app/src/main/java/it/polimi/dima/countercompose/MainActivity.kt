package it.polimi.dima.countercompose

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.sp
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp

import it.polimi.dima.countercompose.ui.theme.CounterComposeTheme
import kotlin.math.roundToInt

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CounterComposeTheme {
                // A surface container using the 'background' color from the theme
                Surface(color = MaterialTheme.colors.background) {
                    Counter()
                }
            }
        }
    }
}


data class Counter(var current: Int, var total: Int)

@Composable
fun Counter() {
    val context = LocalContext.current
    Column(modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally) {
        //var counter by remember { mutableStateOf(0) }
        //var total by remember { mutableStateOf(0) }

        val (counter, setCounter) =
            remember { mutableStateOf(Counter(0,0))}
        //Text(text = counter.toString(), fontSize = 30.sp)
        Text(text = counter.current.toString(), fontSize = 30.sp)
        Row {
            Button(
                //enabled = counter > 0,
                enabled = counter.current > 0,
                onClick = {
                    //counter -= 1
                    setCounter(counter.copy(current = counter.current - 1))

            }) {
                Text("-1")
            }
            Spacer(modifier = Modifier.width(8.dp))
            Button(
                //enabled = counter < 10,
                enabled = counter.current < 10,
                onClick = {
                    setCounter(counter.copy(current = counter.current + 1,
                        total = counter.total + 1))
                    //counter += 1
                    //total += 1
            }) {
                Text("+1")
            }
        }
        Slider(
            modifier = Modifier.padding(8.dp),
            //value = counter.toFloat(),
            value = counter.current.toFloat(),
            valueRange = 0.0f.rangeTo(10.0f),
            steps = 10,
            onValueChange = {
                //counter = it.roundToInt()
                setCounter(counter.copy(current = it.roundToInt()))
            }
        )
        Row {
            Button(onClick = {
                //counter = 0
                setCounter(counter.copy(current = 0))
            }){
                Text("ZERO")
            }
            Spacer(modifier = Modifier.width(8.dp))
            Button(onClick = {
                val intent = Intent(context, ResultActivity::class.java)
                //intent.putExtra(ResultActivity.EXTRA_KEY, total)
                intent.putExtra(ResultActivity.EXTRA_KEY, counter.total)
                context.startActivity(intent)
            }){
                Text("TOTAL")
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    CounterComposeTheme {
        Counter()
    }
}