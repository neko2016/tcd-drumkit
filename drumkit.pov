#include "colors.inc"
#include "textures.inc"
#include "finish.inc"

camera {
    location  <-0.6, 0.7, -3 > 
    right x * 1
    up y * 3/4
    look_at <0, 0, 0>
}

global_settings { ambient_light rgb<1, 1, 1> }

light_source {
    <0, 100, 0>
    color White
}

light_source {
	<0, 0, -20>
	color White
	shadowless
}

light_source {
    <0, 10, 0>
    color Yellow
    spotlight
    radius 5
    falloff 7
    tightness 100
    point_at <0.7, 0, 0>
}

light_source {
    <0, 10, 0>
    color White
    spotlight
    radius 5
    falloff 7
    tightness 100
    point_at <-0.7, 0, 1>
}


// x axis
// cylinder {
//    <-100,0,0>, <100,0,0>, 0.01
//        texture {
//           pigment {checker White color Red}
//    }
// }

// y axis
// cylinder {
//    <0,-100,0>, <0,100,0>, 0.01
//    texture {
//        pigment {checker White color Green}
//    }
// }

// z axis
// cylinder {
//    <0,0,-100>, <0,0,100>, 0.01
//    texture {pigment {checker White color Blue}
//    }
// }


// ==============================bass drum ===========================
#declare drum = union 
{
difference {
difference { 
//bass drum 41*28 (depth*radius) cm
cylinder {
    <0,0,0>, <0,0.41,0>, 0.28
    texture {New_Brass pigment {color Black}
    }              
}

//top cutting cylinder
cylinder {
    <0,0.39,0>, <0,0.45,0>, 0.26
    texture {pigment {color rgbt <1,1,1, 0.07> }}
    }
}
 
//bottom cutting cylinder
cylinder {
    <0,0.02,0>, <0,-0.04,0>, 0.26
    texture {pigment {color rgbt <1,1,1, 0.07> }}
    }
}

//bottom torus for bass drum, major radius = 28 cm, minor radius = 0.5 cm
torus {
    0.28, 0.005
    texture {Chrome_Metal}
    translate <0,0.05,0>
    }

//top torus for bass drum, major radius = 28 cm, minor radius = 0.5 cm
torus {
    0.28, 0.005
    texture {Chrome_Metal}
    translate <0,0.36,0>
    }
}

#declare earset = union {

#declare ear = union {
box {
    <0,0,0> <0.1,0.07,0.1>
    texture {Chrome_Metal}
    translate <0.48,0.70,-0.05>
    scale 0.5
}

cylinder {
    <0,0.3,0> <0,0.37,0> 0.01
    texture {Chrome_Metal}
    translate <0.28,0,0>
}

box {
    <0,0.04,0> <0.1,0.1,0.1>
    texture {Chrome_Metal}
    translate <0.48,0.50,-0.05>
    scale 0.5
}
}

// duplicate the drum ear with while loop
#declare Radius = 0.28;
#declare Nr = 0;
#declare EndNr = 10;
#while (Nr < EndNr)
object {ear 
    rotate <0, Nr* 360/EndNr, 0>
}
    #declare Nr = Nr + 1;
#end

#declare Radius = 0.28;
#declare Nr = 0;
#declare EndNr = 10;
#while (Nr < EndNr)
object {ear 
    rotate <0, Nr* 360/EndNr, 0>
    translate <0,-0.25,0>
}
    #declare Nr = Nr + 1;
#end
}

// the body of bassdrum /////////////////////////////////////////////////////////////////////////
#declare bassdrum = union {object {drum} object {earset}}

object{bassdrum
    rotate <90,0,0>
    translate <0,0,-0.205>
}

// right foot of bass drum
cylinder {
    <0.2,-0.1,0> <0.28,-0.4,0> 0.015
    texture {Chrome_Metal}
}

// left foot of bass drum
cylinder {
    <-0.2,-0.1,0> <-0.28,-0.4,0> 0.015
    texture {Chrome_Metal }
}

// decoration of the right foot of the bass drum
cylinder {
    <0.265,-0.35,0> <0.28,-0.4,0> 0.025
    texture {Rust 
    			pigment {color Black}
    }
}

// decoration of the left foot of the bass drum
cylinder {
    <-0.265,-0.35,0> <-0.28,-0.4,0> 0.025
    texture {Rust 
    			pigment {color Black}
	}
}


// bracket between bass drum and tom-tom 
cylinder {
	<0,0.28,0>, <0,0.29,0> 0.05
	texture {Chrome_Metal}
}

cylinder {
	<0,0.29,0>	, <0,0.45,0> 0.02
	texture {Silver_Metal}
}

cylinder {
	<0,0.43,0> <0,0.45,0> 0.03
	texture {Chrome_Metal}
}

cylinder {
	<0,0.43,0>, <0,0.43,0.1> 0.01
	texture {Chrome_Metal}
	rotate <0,60,0>
}

cylinder {
	<0,0.43,0>, <0,0.43,0.1> 0.01
	texture {Chrome_Metal}
	rotate <0,-60,0>
}		

//=================== components of middle tom ====================

#declare body_m_tom =
union {
difference{
difference {
// middle tom depth*radius 23*15 cm, starting from <1,0,0>
cylinder {
	<1,0,0>, <1,0.23, 0>, 0.15
	texture {New_Brass pigment {color Black}}
}

// cutting cylinder from the top of the middle tom 
cylinder {
	<1,0.22,0>, <1,0.24,0>, 0.13
	texture {pigment {color rgbt <1,1,1, 0.05>}}
}
}

// cutting cylinder from the bottom the middle tom
cylinder {
	<1,-0.01,0>, <1,0.01,0>, 0.13
	texture {pigment {color rgbt <1,1,1, 0.05>}}
}
}

// bottom torus for the middle tom, major radius = 15 cm , minor radius = 0.5 cm
torus {
	0.15, 0.005
	translate <1,0.01,0>
	texture {Chrome_Metal}
}

// top torus for the middle tom, major radius = 15 cm, minor radius = 0.5 cm
torus {
	0.15, 0.005
	translate <1, 0.22,0>
	texture {Chrome_Metal}
}
}

// object {body_m_tom}

// a single handle for the middle tom
#declare handle_m_tom =
union {
cylinder {
	<1,0.01,0>, <1,0.22,0>, 0.005
	texture {Chrome_Metal}
	translate <0,0,-0.15>
	}

cylinder {
	<1,0.08,0>, <1,0.15,0>, 0.007
	texture {Chrome_Metal}
	translate <0,0,-0.15>
	}

cylinder {
	<1,0.115,-0.15>, <1,0.115,-0.157>, 0.01
	texture {Chrome_Metal}
	}
	translate<-1,0,0> // move the unit back to the coordinate origin <0,0,0> before duplication
}

// object {handle_m_tom}

// duplicate handle of middle tom with the while loop at <0,0,0>
#declare handles_m_tom =
union {
#declare radius_m_tom = 0.15;
#declare nr_mt = 0;
#declare end_nr_mt = 10;
#while (nr_mt < end_nr_mt)
object {handle_m_tom
	rotate <0, nr_mt*360/end_nr_mt, 0>
	}
	#declare nr_mt = nr_mt + 1;
#end
}

// move the whole set back to <1,0,0>
#declare hset_m_tom =
object {handles_m_tom translate <1,0,0> }

// combine the body and the handles of middle tom /////////////////////////////////////////////////////////
#declare middletom = union {object {body_m_tom} object {hset_m_tom}}; 

// check if the middle tom exists as a unit 
// object {middletom}

//===================== components of small tom =========================

#declare body_s_tom =
union {
difference {
difference {

// small tom depth*radius 20*13cm, starting from <-1,0,0>
cylinder {
	<-1,0,0>, <-1,0.2,0>, 0.13
	texture {New_Brass pigment {color Black}} 
}

// cutting cylinder from the top of the small tom  
cylinder {
	<-1,0.19,0>, <-1,0.21,0>, 0.11
	texture {pigment {color rgbt <1,1,1, 0.05>}}
}
}

// cutting cylinder from the bottom the small tom
cylinder {
	<-1,-0.01,0>, <-1,0.01,0>, 0.11
	texture {pigment {color rgbt <1,1,1, 0.05>}}
}
}

// bottom torus for the small tom, major radius = 13 cm , minor radius = 0.5 cm
torus {
	0.13, 0.005
	translate <-1,0.01,0>
	texture {Chrome_Metal}
}

// top torus for the small tom, major radius = 13 cm, minor radius = 0.5 cm
torus {
	0.13, 0.005
	translate <-1, 0.19,0>
	texture {Chrome_Metal}
}
}

// object {body_s_tom}

// a single handle for the small tom
#declare handle_s_tom =
union {
cylinder {
	<-1,0.01,0>, <-1,0.19,0>, 0.005
	texture {Chrome_Metal}
	translate <0,0,-0.13>
}

cylinder {
	<-1,0.08,0>, <-1,0.12,0>, 0.007
	texture {Chrome_Metal}
	translate <0,0,-0.13>
}

cylinder {
	<-1,0.10,-0.13>, <-1,0.10,-0.137>, 0.01
	texture {Chrome_Metal}
}
	translate<1,0,0> // move the unit back to the coordinate origin <0,0,0> before duplication
}


// duplicate handle of small tom with the while loop at <0,0,0>
// object {handle_s_tom}
#declare handles_s_tom =
union {
#declare radius_s_tom = 0.13;
#declare nr_st = 0;
#declare end_nr_st = 10;
#while (nr_st < end_nr_st)
object {handle_s_tom
	rotate <0, nr_st*360/end_nr_st, 0>
}
	#declare nr_st = nr_st + 1;
#end
}

// move the whole set back to <-1,0,0>
#declare hset_s_tom =
object {handles_s_tom translate <-1,0,0>}

// combine the body and the handles of small tom
#declare smalltom = union {object {body_s_tom} object {hset_s_tom}}; 

// check if the small tom exists as a unit 
// object {smalltom}

// change the position of the middle tom and the small tome 
// move the middle tom on to the bracket
//    translate <-0.8,0.37,0.15>  
//	rotate <20,0,0>  
object {middletom translate <-0.8,0.37,-0.05>  rotate <20,0,0>}


// move the small tom on to the bracket
//	translate <0.8,0.37,0.15>
//	rotate <20,0,0> 
object {smalltom translate <0.8,0.37,-0.05>  rotate <20,0,0>}


// =================== components of the stand =====================

// cymbal stand at <1,0,0> 
#declare cymbalstand =
union {
// the vertical stand
cylinder {
	<1,-0.26,0> <1,0.8,0>, 0.01
	texture {PinkAlabaster pigment {color Grey}}
}

// the ring
cylinder {
	<1,-0.14,0> <1, -0.16, 0>, 0.015
	texture {Chrome_Metal}
}


// a foot for the cymbal stand
#declare foot =
union {
cylinder {
	<1, -0.15, 0>  <0.75, -0.4, 0>, 0.009
	texture {PinkAlabaster pigment {color Grey}}
}

// rubber decoration of the foot of cymbal stand
cylinder {
	<0.75, -0.4, 0>, <0.77, -0.38, 0>, 0.015
	texture {Rust pigment {color Black}
	}
}

translate <-1,0,0>
}

// duplicate the foot with the while loop at <0,0,0>
// object {feet}
#declare feet =
union {
#declare radius_foot = 0.25;
#declare nr_foot = 0;
#declare end_nr_foot = 3;
#while (nr_foot < end_nr_foot)
object {foot
	rotate <0, nr_foot*360/end_nr_foot, 0>
}
	#declare nr_foot = nr_foot + 1;
#end
}

// move the whole set back to <-1,0,0>
#declare feet_move =
object {feet translate <1,0,0>}

object {feet_move}

// the ring in the middle of the stand
cylinder {
	<1, 0.15, 0> <1, 0.19, 0>, 0.015
	texture {Chrome_Metal}
}

cylinder {
	<1, 0.44, 0> <1,0.48,0>, 0.015
	texture {Chrome_Metal}
}

cylinder {
	<1, 0.76, 0> <1,0.8,0>, 0.015
	texture {Chrome_Metal}
}	

// the tilted stance 
cylinder {
	<0.83, 0.7, 0> < 1.33, 0.9, 0>, 0.01
	texture {PinkAlabaster pigment {color Grey}}
}	

// small vertical stance
cylinder {
	<1.33, 0.9, 0> <1.33, 0.98, 0>, 0.01
	texture {PinkAlabaster pigment {color Grey}}
	}
}

// check if the cymbalstand is grouped
// object {cymbalstand}
// this is the end of the cymbal stance from <1, 0, 0> to  <1, 0.98, 0>


// ================== change the position of the cymbal stand =====================
// change the positions of the original cymbal stance at <1, 0, 0>
// the LEFT cymbal stand  ---------------------------------------------------------------------------------------
// object {cymbalstand translate <-2, 0, 0>}

// the RIGHT cymbal stand, at the front ----------------------------------------------------------------------
object {cymbalstand rotate < 0, 180, 0> translate <1.8, 0, 0> }


// =================== creating a cymbal =============================
// create a cymbal at <2, 0, 0> 
#declare hat_flat =
cylinder {
	<2, 0, 0> < 2, 0.007, 0>, 0.229
	texture {Bronze_Metal 
		normal { bumps 1 scale 0.01 } // to be modified ====================================
	}
}

#declare bell =
difference {
ovus {
	0.1, 0.065
	texture {Bronze_Metal}
	translate <2,-0.13, 0>
	}
box {
	<0, 0, 0> < 1, 1, 1> 
	scale 0.3
	translate <1.85, -0.3, -0.15>
	texture {Bronze_Metal}
	}
}

#declare hat = 
difference {
	union {object {hat_flat} object {bell}}
ovus {
	0.1, 0.065
	texture {Bronze_Metal}
	scale 0.9
	translate <2,-0.12, 0>
	}
} // the distance between the bottom of the yellow cylinder and the top of the blue ovus is about 0.02, namely the radius of the hallow is about 0.02
// the end of making a cymbal

// move the cymbal at <2, 0, 0> to <0.66, 0.95, 0>, THE RIGHT CYMBAL -----------------------------------------------------------------------------------
// object {hat translate <-1.33, 0.95, 0>}
object {hat translate <-1.37, 0.845, 0.15> rotate <-12,0,10>} 

// move the cymbal at <2, 0, 0> to <0.67, 0.95, 0>, THE LEFT CYMBAL ---------------------------------------------------------------------------------------
// object {hat translate <-1.33, 0.95, 0> rotate <0, 180, 0>}
// object {hat rotate <10, 0, 10> translate <-1.3, 0.6, 0> rotate <0, 180, 0>}

// the original cymbalstand <1, 0, 0> had to be moved to <-1, 0, 0>, rotated around Y to be the cymbal stand at the RIGHT
#declare cymbal_stand_right =
union {
	object {cymbalstand translate <-2, 0, 0> rotate <0, 180, 0> } 
	object {hat translate <-1.33, 0.95, 0> 	}
}

// ======================= hi-hat cymbal =================================
// transform the cymbal_stand_right at <1, 0, 0>  into a hi-hat cymbal in between at <0.8, 0, 0.4> * 0.8 = <0.64, 0, 0.32>
object {cymbal_stand_right translate <-0.2, 0, 0.15> scale 0.8 translate <-0.17, -0.074, -0.3>}

// unify a cymbal and a stand in the left at <-1, 0, 0>
#declare cymbal_stand_left =
union {
	object {cymbalstand translate <-2, 0, 0>}
	object {hat rotate <10, 0, 10> translate <-1.3, 0.6, 0> rotate <0, 180, 0>} // translate <-1.33, 0.95, 0> rotate <0, 180, 0>} // change 0.98 to 0.95
}

// move the LEFT cymbal and its stand from <-1, 0, 0>  to another new location
object {cymbal_stand_left translate <0.25, 0, 0.35>}


// ============================ floor tom ================================
// transform the bassdrum into a floor tom at <-1, 0, 0>
#declare body_ftom=
object {bassdrum scale 0.8 translate <-1, 0, 0>}

#declare foot_ftom =
union {
cylinder {
	<-1.224, 0.15, 0> <-1.224, -0.08, 0> 0.01
	texture {Chrome_Metal}
	}
cylinder {
	<-1.224, -0.08, 0> < -1.324, -0.18, 0> 0.01 
	texture {Chrome_Metal}
	}
cylinder {
	<-1.324, -0.18, 0> <-1.324, -0.28, 0> 0.01 
	texture {Chrome_Metal}
	}
cylinder {
	<-1.324, -0.24, 0> <-1.324, -0.28, 0> 0.013
	texture {Rust pigment {color Black}}	
}
translate <1,0,0>	// move the foot_ftom to the point where the floor tom is at <0, 0, 0>
}

// duplicate the foot of the floor tom with while loop
#declare feet_ftom = 
union {
#declare radius_ft = 0.28 * 0.7;
#declare nr_ft = 0;
#declare end_nr_ft = 3;
#while (nr_ft < end_nr_ft)
	object {foot_ftom rotate < 0, nr_ft * 360/end_nr_ft, 0>}
	#declare nr_ft = nr_ft + 1;
#end	
}

// move the feet_ftom back to <-1,0,0>
#declare feet_ftom_move = 
object {feet_ftom translate <-1, 0, 0>}

// floor tom at <0, 0, 0>
#declare floortom =
union {
	object {body_ftom} object {feet_ftom_move} translate <1, 0, 0>
}

object {floortom translate <-0.6, -0.12, -0.2>}


// =====================making the stage============================
plane {
	y, -0.4
	texture {NBoldglass}
}












	