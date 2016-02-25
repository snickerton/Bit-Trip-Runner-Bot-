import java.awt.*;
import java.awt.event.*;
import java.awt.image.*;
import java.awt.Color;

import javax.swing.*;
import javax.swing.text.*;

public class Main {
	
	static JTextArea ta;
	static Boolean printToConsole;
	static Robot robot;

	public static void main(String[] args) throws AWTException, InterruptedException {
	
		createConsole();
		
		 Boolean bossMode = false;
		 printToConsole = true;
		
		 robot = new Robot();
		 Rectangle captureSize = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
		 BufferedImage scrn = robot.createScreenCapture(captureSize);
		 
		 int cnt = 0;
		
		 
		 while(!bossMode){
			 scrn = robot.createScreenCapture(captureSize);
			 
			 robot.keyPress(KeyEvent.VK_DOWN);
			 
			 Color habeUSeenB0ss = avgColor(scrn, 1060, 430, 40, 40);
			
			 Color eyb0ss = new Color(60, 43, 16);
			 //String b0ss = Integer.toHexString(eyb0ss.getRGB());
			 //ta.append(eyb0ss.getRed()+" "+eyb0ss.getGreen()+" "+eyb0ss.getBlue()+"\n");
			 ta.append("Boss Color: R: "+habeUSeenB0ss.getRed()+" G: "+habeUSeenB0ss.getGreen()+" B: "+habeUSeenB0ss.getBlue()+"\n");
			 
			 //CHECK FOR b0ss
			 //see if the color of the selected area is around the color of actual b0ss
			 
			 if(habeUSeenB0ss.getRed() < eyb0ss.getRed()+10 && habeUSeenB0ss.getRed() > eyb0ss.getRed()-10 
			 && habeUSeenB0ss.getGreen() < eyb0ss.getGreen()+10 && habeUSeenB0ss.getGreen() > eyb0ss.getGreen()-10 
			 && habeUSeenB0ss.getBlue() < eyb0ss.getBlue()+10 && habeUSeenB0ss.getBlue() > eyb0ss.getBlue()-10)
			 {
				 ta.append("b0ss!"+"\n");
				 bossMode = true;
			 }
			 
			 robot.keyRelease(KeyEvent.VK_UP);
			 robot.keyPress(KeyEvent.VK_UP);
			 
			 
			 //once every 1/10th of a second
			 Thread.sleep(500); 
		 }
		 
		 while(bossMode){
			 //scrn = robot.createScreenCapture(captureSize);
			 scrn = robot.createScreenCapture(new Rectangle(569,574,40,40));
			 
			 //reduce lag from previous while loop
			 robot.keyRelease(KeyEvent.VK_UP);

			 
			 //CHECK FOR BOTTOM METEOR
			 //Color cPos = avgColor(scrn, 588, 574, 40, 40);
			 Color cPos = avgColor(scrn, 0, 0, 40, 40);
			 
			 //IF PAUSE SCREEN STOP PRINTING SHIT 
			 if(cPos.getRed() == 105 && cPos.getGreen() == 127 && cPos.getBlue() == 155){
				 printToConsole = false;
			 } 
			 else{
				 printToConsole = true;
			 }
			 
			 if(printToConsole){
				 ta.append("Comet Color: R: "+cPos.getRed()+" G: "+cPos.getGreen()+" B: "+cPos.getBlue()+"\n");
			 }
			 
			 //just see when that spot turns significantly more red
			 if(cPos.getRed() - cPos.getGreen() > 15 && cPos.getRed() - cPos.getBlue() > 26  ) {
						 ta.append("comet!"+"\n"); 
						
						 
						    robot.keyRelease(KeyEvent.VK_DOWN);
							
							robot.keyPress(KeyEvent.VK_SPACE);
							robot.keyRelease(KeyEvent.VK_SPACE);
							robot.keyPress(KeyEvent.VK_SPACE); 
							robot.keyRelease(KeyEvent.VK_SPACE);
							
							robot.keyPress(KeyEvent.VK_DOWN);
						 
						 
						 //SPAM THE SPACE BAR
						 //SPAMDAHSPACEBAR();
						 //JUST FUCKING SPAM IT
						 
						
			 }
			 
			 

			 
			 
			 //just fucking spam it. it doesn't affect gameplay anyways
			 //jk don't spam as much otherwise lag
			 if(cnt%10 == 0){
				 robot.keyPress(KeyEvent.VK_UP);
				 robot.keyRelease(KeyEvent.VK_UP);
			 
				 //KICK THE FUCKING MINECART
				 robot.keyPress(KeyEvent.VK_A);
				 robot.keyRelease(KeyEvent.VK_A);
				 
				 if(printToConsole){
					 ta.append("ULTRA RARE POKEMANASLKDFJALSKDHFALJEGJAEBAJ"+"\n");
				 }
			 
			 }
			 
			 //once every 1/100th of a second
			 Thread.sleep(14);
			 cnt++;
		 }
		 
		 //Periodically click the up key
		
		 
		 
		 
		 
 	}
	
	public static void SPAMDAHSPACEBAR(){
		robot.keyRelease(KeyEvent.VK_DOWN);
		
		robot.keyPress(KeyEvent.VK_SPACE);
		robot.keyRelease(KeyEvent.VK_SPACE);
		robot.keyPress(KeyEvent.VK_SPACE); 
		robot.keyRelease(KeyEvent.VK_SPACE);
		
		robot.keyPress(KeyEvent.VK_DOWN);

	}
	
	public static void createConsole(){
		JFrame frame = new JFrame();
        frame.add(new JLabel("Debug Console"), BorderLayout.NORTH);

        ta = new JTextArea();
        DefaultCaret caret = (DefaultCaret)ta.getCaret();
        caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
        
        
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setPreferredSize(new Dimension(240, 800));
        frame.setAlwaysOnTop(true);
        frame.setVisible(true);
        frame.add(new JScrollPane(ta));

        frame.pack();
	}

	public static Color avgColor(BufferedImage bi, int x0, int y0, int w, int h) {
	    int x1 = x0 + w;
	    int y1 = y0 + h;
	    float sumr = 0, sumg = 0, sumb = 0;
	    for (int x = x0; x < x1; x++) {
	        for (int y = y0; y < y1; y++) {
	            Color pixel = new Color(bi.getRGB(x, y));
	            sumr += pixel.getRed();
	            sumg += pixel.getGreen();
	            sumb += pixel.getBlue();
	            
	        }
	    }
	    float num = w * h;
	    
	    return new Color(Math.round(sumr/num), Math.round(sumg/num), Math.round(sumb/num));
	}
	
}
