/********************************************************************
*
*   DESCRIPTION: Generate target for Radar cell-DEVS model
*
*   AUTHOR: Elizabeth Hosang
*
*   Date: 25/11/2011
*
*********************************************************************/

/** include files **/
#include "TargetGen.h"           // base header
#include "message.h"       // InternalMessage ....
#include "distri.h"        // class Distribution
#include "mainsimu.h"      // class MainSimulator


/*******************************************************************
* Function Name: TargetGen
* Description: constructor
********************************************************************/
TargetGen::TargetGen( const string &name )
: Atomic( name )
, out(addOutputPort("out"))
, statsOut_out(addOutputPort("statsOut_out"))
{
    m_randnumber = 0;
    m_timePeriod = 100 * 10;
    m_timerStarted = false;
}

/*******************************************************************
* Function Name: initFunction
********************************************************************/
Model &TargetGen::initFunction()
{
	m_state = Generating;
	m_timerStarted = true;
	holdIn(passive, Time(0, 0, 0, m_timePeriod));
	return *this ;
}

/*******************************************************************
* Function Name: externalFunction
* Description: This method executes when an external event is received.
********************************************************************/
Model &TargetGen::externalFunction( const ExternalMessage &msg )
{
	holdIn(active, 0);
	return *this;
}

/*******************************************************************
* Function Name: internalFunction
* Description: This method executes when the TA has expired, right after the outputFunction has finished.
* 			   The new state and TA should be set.
********************************************************************/
Model &TargetGen::internalFunction( const InternalMessage &msg )
{
	holdIn(passive, Time(0, 0, 0, m_timePeriod));
	return *this;

}

/*******************************************************************
* Function Name: outputFunction
* Description: This method executes when the TA has expired. After this method the internalFunction is called.
*              Output values can be send through output ports
********************************************************************/
Model &TargetGen::outputFunction( const InternalMessage &msg )
{
	sendOutput(msg.time(), out, 1);
	return *this;

}

TargetGen::~TargetGen()
{
	//TODO: add destruction code here. Free distribution memory, etc.
}
