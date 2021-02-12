/*
    Day 4 Loops. Starting with skipping items
    I tried putting all the code in the same file and it was too buggy
 */

// Skipping items

/*
    If you want to skip the current item and continue on to the next one, you should use continue instead.
 
 To demonstrate this we wrote a while loop that skips odd numbers
 */

for i in 1...10 {
    // The remainder operator figures out how many times 2 fits into each number
    if i % 2 == 1 {
        continue
    }
    print(i)
}

// Infinite loops

/*
    It's common to use while loops to make infinite loops: loops that either have no end or only end when you're ready. All apps on your iPhone use infinite loops, bc they start running, then continually watch for events until you choose to quit them.
 
 To make an inifinte loop, just use true as your condition
 
 WARNING: Make sure you have a check that exits your loop, otherwise it will never end
 */

// Check to exit loop
var counter = 0

while true {
    print(" ")
    counter += 1
    
    if counter == 273 {
        break
    }
}


