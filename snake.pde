// Global variable
var canvasWidth;
var canvasHeight;
var centerWidth;
var centerHeight;
var xPos;
var yPos;
var bodyLength;
var state;
var velocity;
var intersection;

void setup() {
    // Initialize the canvas width and height
    canvasWidth = window.innerWidth - 15;
    canvasHeight = window.innerHeight - 20;
    
    // Setup the width and height based on client browser
    size(canvasWidth, canvasHeight);
    
    // Initialize global variable
    centerWidth = width / 2;
    centerHeight = height / 2;
    
    xPos = centerWidth;
    yPos = centerHeight;
    
    bodyLength = 5;
    state = RIGHT;
    
    velocity = 1;
    
    // Setup the FPS
    frameRate(24);
}

void draw() {

    // Redraw the background
    background(100);
    
    // Debugging
    println(xPos);
    println(yPos);
    
    // Border Line
    if (xPos >= canvasWidth)
        xPos = 0;
        
    if (xPos < 0)
        xPos = canvasWidth;
        
    if (yPos >= canvasHeight)
        yPos = 0;
        
    if (yPos < 0)
        yPos = canvasHeight;
    
    // Draw the snake
    drawSnake(xPos, yPos);
    
    // Control the snake
    if (keyPressed) {
//        velocity++;
        
        if (state != UP && state != DOWN && keyCode == UP) {
            state = UP;
//            intersection[] = 
        } else if (state != DOWN && state != UP && keyCode == DOWN) {
            state = DOWN;
        } else if (state != LEFT && state != RIGHT && keyCode == LEFT) {
            state = LEFT;
        } else if (state != RIGHT && state != LEFT && keyCode == RIGHT) {
            state = RIGHT;
        } else {
//            velocity--;
        }
    }
    
    if (state == UP)
        yPos-=velocity;
    else if (state == DOWN)
        yPos+=velocity;
    else if (state == LEFT)
        xPos-=velocity;
    else
        xPos+=velocity;
}

void bodyPart(x, y) {
    rect(x, y, 5, 5);
}

void bodyLinePart(x, y) {
    if (state == UP || state == DOWN)
        rect(x, y, 5, 1);
    else
        rect(x, y, 1, 5);
}

void drawSnake(x, y) {
//    var start = bodyLength + bodyLength - 1;

    fill(0, 0, 0);
    for (var i = bodyLength; i >= 1; i--) {
        if (state == DOWN) {
            bodyPart(x, y - i * 5);
        } else if (state == UP) {
            bodyPart(x, y + i * 5);
        } else if (state == LEFT) {
            bodyPart(x + i * 5, y);
        } else {
            bodyPart(x - i * 5, y);
        }
    }
    
//    for (var i = start; i >= 1 ; i--) {
//        if (state == DOWN) {
//            if (i % 2 != 0)
//                bodyPart(x, y - i * 5);
//            else
//                bodyLinePart(x, 2 + y - i * 5);
//        } else if (state == UP) {
//            if (i % 2 != 0)
//                bodyPart(x, y + i * 5);
//            else
//                bodyLinePart(x, 2 + y + i * 5);
//        } else if (state == LEFT) {
//            if (i % 2 != 0)
//                bodyPart(x + i * 5, y);
//            else
//                bodyLinePart(2 + x + i * 5, y);
//        } else {
//            if (i % 2 != 0)
//                bodyPart(x - i * 5, y);
//            else
//                bodyLinePart(2 + x - i * 5, y);
//        }
//    }
}
