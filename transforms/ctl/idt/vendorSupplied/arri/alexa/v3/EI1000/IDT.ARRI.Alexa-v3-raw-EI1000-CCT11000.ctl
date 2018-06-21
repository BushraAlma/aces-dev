
// <ACEStransformID>IDT.ARRI.Alexa-v3-raw-EI1000-CCT11000.a1.v2</ACEStransformID>
// <ACESuserName>ACES 1.0 Input - ARRIRAW (EI1000, 11000K)</ACESuserName>

// ARRI ALEXA IDT for ALEXA linear files
//  with camera EI set to 1000
//  and CCT of adopted white set to 11000K
// Written by v3_IDT_maker.py v0.09 on Thursday 22 December 2016

const float EI = 1000.0;
const float black = 256.0 / 65535.0;
const float exp_factor = 0.18 / (0.01 * (400.0/EI));

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	// convert to white-balanced, black-subtracted linear values
	float r_lin = (rIn - black) * exp_factor;
	float g_lin = (gIn - black) * exp_factor;
	float b_lin = (bIn - black) * exp_factor;

	// convert to ACES primaries using CCT-dependent matrix
	rOut = r_lin * 8.5415841761627e-01 + g_lin * 1.8830616058631e-01 + b_lin * -4.2464578202580e-02;
	gOut = r_lin * 1.0110657573640e-01 + g_lin * 1.1769487987806e+00 + b_lin * -2.7805537451702e-01;
	bOut = r_lin * 4.9111866753279e-02 + g_lin * -2.5503968938492e-01 + b_lin * 1.2059278226316e+00;
	aOut = 1.0;

}