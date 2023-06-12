/*******************************************************************
*
*  DESCRIPTION: Simulator::registerNewAtomics()
*
*  AUTHOR: Elizabeth Hosang
*
*  EMAIL: mailto://eahosang@scs.carleton.ca
*
*  DATE: 25/10/2011
*
*******************************************************************/

#include "modeladm.h"
#include "mainsimu.h"
#include "TargetGen.h"                // Generate targets

void MainSimulator::registerNewAtomics()
{
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<TargetGen>() , "TargetGen" ) ;
}
