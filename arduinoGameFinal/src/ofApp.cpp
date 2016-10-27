#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    
    size(1000, 1000);
    rectY= 400;
    rectX = 100;
    
    xPos = 620;
    xPosTwo= 1000;
    
    loop = true;
    lose = false;
    speed = .8; //initial speed
    lives= 3; //3 lives to begin with
    
    reset = true;
    
    timer = 0; // initally clock is set to zero
    mil = 0;
    
    frameRate(30);
    
    velocity = new PVector(0, 0);
    gravity = new PVector(0, 0.3);
    position = new PVector (150, 400); //starting position of ship
    friction = new PVector(0, 0);
    
    ship = new Ship();
    
    
    planet1 = new Planet(random(1000, 1250), 100, 90, 3.5, 200, 50, 100);
    planet2 = new Planet(random(1000, 1250), 300, 70, 3, 250, 20, 80);
    planet3 = new Planet(1050, 579, 150, 3, 250, 0, 90);
    planet4 = new Planet(900, 744, 80, 2.5, 180, 55, 120);
    planet5 = new Planet(random(1000,1250), 280, 60, 5, 250, 80, 190);
    planet6 = new Planet(1500, 500, 40, 3.5, 230, 20, 120);
    planet7 = new Planet(750, 980, 60, 3.9, 250, 80, 190);
    planet8 = new Planet(2970, 566, 50, 2.5, 140, 0, 60);
    planet9 = new Planet(2470, 306, 30, 2.9, 150, 20, 80);
    planet10 = new Planet(random(1000, 1750), 280, 70, 3.9, 250, 10, 190);
    planet11 = new Planet(random(1000, 2970), 566, 50, 3, 140, 0, 60);
    planet12 = new Planet(random(1000,2470) , 306, 120, 3, 120, 40, 70);
    
    green1 = new Planet(1550, 200, 60, 2.6, 80,240,80);
    green2 = new Planet(1850, 200, 60, 3, 85,250,100);
    
    minim = new Minim (this);
    music = minim.loadFile("Barge.mp3");
    music.loop();
    
    minim = new Minim (this);
    powerup = minim.loadFile("powerup.wav");
    //powerup.loop();
    
    minim = new Minim (this);
    powerdown = minim.loadFile("powerdown2.wav");
    // powerdown.loop();

}

//--------------------------------------------------------------
void ofApp::update(){
    
    

}

//--------------------------------------------------------------
void ofApp::draw(){
    
    if (state == 0 && reset ==true) {
        background(0);
        
        music.play();
        
        actualTime = int(millis()/1000);
        timer = int(actualTime-resetTime);
        
        ship.display();
        
        
        planet1.display();
        planet2.display();
        planet3.display();
        planet4.display();
        planet5.display();
        planet6.display();
        planet7.display();
        planet8.display();
        planet9.display();
        planet10.display();
        planet11.display();
        planet12.display();
        
        
        
        
        //stars
        
        fill(255);
        ellipse(random(1000), random(1000), 7, 7);
        fill(255);
        ellipse(random(1000), random(1000), 7, 7);
        fill(255);
        ellipse(random(1000), random(1000), 7, 7);
        fill(255);
        ellipse(random(1000), random(1000), 7, 7);
        fill(255);
        ellipse(random(1000), random(1000), 7, 7);
        fill(255);
        ellipse(random(1000), random(1000), 7, 7);
        
        
        if (moveUp == true) { //continue to move up
            position.add(velocity);
            
            friction.y = 0.1;
            if (velocity.y <0) {
                velocity.add(friction);
                
            } else
            {
                velocity.y =0;
                
                
            }
        }
        
        if (moveDown == true) { //continue to move down
            position.add(velocity);
            friction.y = -0.1;
            if (velocity.y >0) {
                velocity.add(friction);
            } else {
                velocity.y =0;
                
            }
        }
        
        
        
        if (int(dist(position.x, position.y, planet1.xPos, planet1.yPos)) < planet1.size/2+38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet2.xPos, planet2.yPos)) < planet2.size/2+38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet3.xPos, planet3.yPos)) < planet3.size/2+38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet4.xPos, planet4.yPos)) < planet4.size/2+38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet5.xPos, planet5.yPos)) < planet5.size/2+38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet6.xPos, planet6.yPos)) < planet6.size/2+38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet7.xPos, planet7.yPos)) < planet7.size/2+38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet8.xPos, planet8.yPos)) < planet8.size/2 +38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        if (int(dist(position.x, position.y, planet9.xPos, planet9.yPos)) < planet9.size/2 +38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet10.xPos, planet10.yPos)) < planet10.size/2+38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
        if (int(dist(position.x, position.y, planet11.xPos, planet11.yPos)) < planet11.size/2 +38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        if (int(dist(position.x, position.y, planet12.xPos, planet12.yPos)) < planet12.size/2 +38) {
            state = 1;
            
            frames ++;
            justHit = true;
        }
        
    }
    //  
    //when you lose
    
    //if(lives ==0){
    // state =1; 
    //}
    
    else{
        reset = false;
        background(255, 0, 0);
        textSize(60);
        fill(0, 0, 0);
        text("Sorry you Lose!", width/4, height/4+200);
        textSize(40);
        text("Click to Restart", width/4+50, height/3+200);
        redTimer ++;
    }
    
    
    
    fill(255);
    header = loadFont("AppleColorEmoji-48.vlw");
    textSize(15);
    textFont(header);
    text("Space Battle", 12, 60);
    textSize(40);
    text("Timer:" + timer, 730, 60);
    textSize(25);
    text("Use Up & Down Arrows", 400, 60);
    
    //if you lose print the end time
    if (state ==1) {
        textSize(40);
        text("Timer:" + endTime, 730, 60);
        endTime = int(actualTime-resetTime);
        
        // redTimer = (1/30) * redTimer;
    }
    
    redTimerSec = redTimer/30;
    
    
    println("xPos" + xPos);
    println("xPosTwo" + xPosTwo);
}



}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    if (key ==CODED) {
        if (keyCode ==UP) {
            velocity.y=-4;
            position.add(velocity);
            velocity.add(gravity);
            moveUp = true;
            moveDown = false;
            powerup.play();
            powerup.rewind();
        } else if (keyCode ==DOWN) {
            velocity.y = 4;
            position.add(velocity);
            velocity.add(gravity);
            moveDown = true;
            moveUp = false;
            powerdown.play();
            powerdown.rewind();
        } else if (keyCode == UP && state ==1) {
            state =0;
            reset = true;
        } else if (keyCode == DOWN && state ==1) {
            state =0; 
            reset = true;
        }
    }

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
    
    state= 0;
    //timer = timer - timer;
    reset = true;
    setup();
    endTime = int(actualTime-resetTime);
    
    redDuration = redTimerSec + redDuration;
    
    resetTime = actualTime + redDuration;
    
    resetTime = actualTime + redTimerSec;
    //actualTime =0;
    
    redTimer = 0; //reset the redtimer
    

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
