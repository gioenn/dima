package it.polimi.dima.countercompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.sp
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue
import androidx.compose.ui.unit.dp

import it.polimi.dima.countercompose.ui.theme.CounterComposeTheme

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

@Composable
fun Counter() {
    Column(modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally) {
        var counter by remember { mutableStateOf(0) }
        Text(text = counter.toString(), fontSize = 30.sp)
        Row {
            Button(
                enabled = counter > 0,
                onClick = {
                counter -= 1
            }) {
                Text("-1")
            }
            Spacer(modifier = Modifier.width(8.dp))
            Button(enabled = counter < 10,
                onClick = {
                counter += 1
            }) {
                Text("+1")
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