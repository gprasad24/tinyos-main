/*
 * Copyright (c) 2006 Stanford University.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the Stanford University nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL STANFORD
 * UNIVERSITY OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package net.tinyos.mviz;

// DShapeModel.java
/*
 Store the data state for a single shape:
  type, two points, color
 Supports DShapeModelListeners.
*/
import java.awt.*;

import javax.swing.*;
import java.util.*;
import java.awt.event.*;
import java.io.*;


class DLinkModel 
extends Object 
implements Serializable {

	public static final int VALUE = 0;
	public static final int MOTION = 1;
	public static final int ANY = 1;
	
	
    public DDocument root;
    transient private ArrayList<DLinkModelListener> listeners;
    
    protected int x12, y12;
    protected float[] values;
    protected Color[] colors;
    
    DMoteModel m1;
    DMoteModel m2;
    
    protected int COLOR_MAX = 230;
	
    public DLinkModel(DMoteModel m1, DMoteModel m2, Random rand, DDocument root){
        this.root = root;
        this.m1 = m1;
        this.m2 = m2;
        
        x12 = getMiddle(m1.x, m2.x);
        y12 = getMiddle(m1.y, m2.y);
        
        values = new float[root.sensed_links.size()];
        colors = new Color[root.sensed_links.size()];
        
        for (int i=0; i<root.sensed_links.size(); i++){
            values[i] = rand.nextFloat()*1000;     
            colors[i] = setColor(values[i]);
        }   
        
        listeners = null;
    }
    
    private int getMiddle(int x1, int x2){
    	return (x1 + x2)/2;
    }
    
    public Color setColor(float value){
        int color = (int)(value)%COLOR_MAX;
        return new Color(color+15, color, color+25);
    } 
	
	public float getValue() { return(values[root.selectedLinkIndex]); }	
	public int getTop() { return(Math.min(m1.y, m2.y)); }		
	public int getBottom() { return(Math.max(m1.y, m2.y)); }		
	public int getLeft() { return(Math.min(m1.x, m2.x)); }		
	public int getRight() { return(Math.max(m1.x, m2.x)); }
	
	public int getWidth() { return(Math.abs(m1.x - m2.x)); }
	public int getHeight() { return(Math.abs(m1.y - m2.y)); }
	
	public void setValue(float value){
	    values[root.selectedLinkIndex] = value;
	    fireChanges();
	}
	public int getLocX() {
	    return x12;
	}	
	public int getLocY() {
	    return y12;
	}		
	public Color getColor() { 
	    return colors[root.selectedLinkIndex]; 
	}
	
	
	public void addListener(DLinkModelListener listener) {
	    if (listeners == null) listeners = new ArrayList<DLinkModelListener>();
	    Iterator it = listeners.iterator();
		while (it.hasNext()) { if (it.next() == listener) return; };		
		listeners.add(listener);	    
	}

	public void removeListener(DLinkModelListener listener) {
	    if (listeners == null) return;	    
	    Iterator it = listeners.iterator();
		while (it.hasNext()) {
		    if (it.next() == listener){
		        it.remove();
		        return;
		    }		
		}	        	
	}
	//=========================================================================/
	protected void fireChanges(){
	    if (listeners==null) return;
	    Iterator it = listeners.iterator();
		while (it.hasNext()) 
		   ((DLinkModelListener)(it.next())).shapeChanged(this, ANY);
	}
	
}

