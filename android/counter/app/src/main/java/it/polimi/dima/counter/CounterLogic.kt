package it.polimi.dima.counter

class CounterLogic {
    var total = 0
        private set
    var current = 0
        private set

    fun addOne() {
        current += 1
        total += 1
    }
    fun zero() {
        current = 0
    }
}