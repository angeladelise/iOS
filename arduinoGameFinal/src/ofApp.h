#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
    
    //for character
    float rectY;
    float rectX;
    
    //for bad circles
    float xPos;
    float yPos;
    
    //array for bad circle y positions for first round
    float [] circleY = {50, 240, 340, 500};
    float [] circleYTwo = {120, 260, 380, 520};
    
    
    float xPosTwo;
    float yPosTwo;
    
    //to repeat bad rectangles
    boolean loop;
    boolean justLost;
    //lose screen
    boolean lose;
    boolean justHit;
    
    float speed;
    
    float d; //distance float for first planets
    float dTwo; //distance float for second planets
    
    float line;
    
    int lives; //how many lives the user has
    int count;
    
    Boolean hit; //when it is the ship is hit once
    Boolean dead; //when you run out of lives
    Boolean restart;
    
    int frames;
    
    int state; //state of the game I am in
    
    Boolean reset;
    
    ofTrueTypeFont header;
    
    int mil;
    int timer;
    int endTime; //when you lose the time stays on the screen
    float actualTime; //millis counter
    float resetTime;
    //int startTime =0;
    
    float redDuration;
    float redTimer;
    float redTimerSec;
    
    
    ofVec2f velocity;
    ofVec2f gravity;
    ofVec2f position;
    ofVec2f friction;
    
    Ship ship;
    Planet green1;
    Planet green2;
    
    Planet planet1;
    Planet planet2;
    Planet planet3;
    Planet planet4;
    Planet planet5;
    Planet planet6;
    Planet planet7;
    Planet planet8;
    Planet planet9;
    Planet planet10;
    Planet planet11;
    Planet planet12;
    
    Boolean moveUp;
    Boolean moveDown;
		
};
