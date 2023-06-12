/*******************************************************************
*
*  DESCRIPTION: Initial Investor Pool for Ponzi Scheme Model
*
*  AUTHOR: Elizabeth Hosang
*
*  EMAIL: mailto://eahosang@scs.carleton.ca
*
*  DATE: 25/10/2011
*
*******************************************************************/
#ifndef __TARGETGEN_H
#define __TARGETGEN_H
/** include files **/
#include "atomic.h"  // class Atomic

/** declarations **/
class TargetGen: public Atomic
{
public:

	TargetGen( const string &name = "TargetGen" ) ;	 // Default constructor

	~TargetGen();					// Destructor

	virtual string className() const
		{return "TargetGen";}
		enum GeneratorState {Initial, Generating};

protected:
	Model &initFunction();

	Model &externalFunction( const ExternalMessage &msg );

	Model &internalFunction( const InternalMessage &msg );

	Model &outputFunction( const InternalMessage &msg );

private:
	//  In Ports
	Port &out ;    // Output a target
    Port &statsOut_out;     // Used for reporting status

    double m_randnumber;
    int  m_timePeriod;    // Time period between new investors
    bool m_timerStarted;
    GeneratorState m_state;    // Internal state of the model
};	// class TargetGen


#endif    //__TARGETGEN_H
