/**
 * TestNetworkC exercises the basic networking layers, collection and
 * dissemination. The application samples DemoSensorC at a basic rate
 * and sends packets up a collection tree. The rate is configurable
 * through dissemination.
 *
 * See TEP118: Dissemination, TEP 119: Collection, and TEP 123: The
 * Collection Tree Protocol for details.
 * 
 * @author Philip Levis
 * @version $Revision: 1.1.2.13 $ $Date: 2006-10-03 00:18:43 $
 */
#include "TestNetwork.h"
#include "Ctp.h"

configuration TestNetworkAppC {}
implementation {
  components TestNetworkC, MainC, LedsC, ActiveMessageC;
  components new DisseminatorC(uint16_t, SAMPLE_RATE_KEY) as Object16C;
  components CollectionC as Collector;
  components new CollectionSenderC(CL_TEST);
  components new TimerMilliC();
  components new DemoSensorC();
  components new SerialAMSenderC(CL_TEST);
  components SerialActiveMessageC;
  components new SerialAMSenderC(AM_COLLECTION_DEBUG) as UARTSender;
  components UARTDebugSenderP as DebugSender;
  components RandomC;

  TestNetworkC.Boot -> MainC;
  TestNetworkC.RadioControl -> ActiveMessageC;
  TestNetworkC.SerialControl -> SerialActiveMessageC;
  TestNetworkC.RoutingControl -> Collector;
  TestNetworkC.Leds -> LedsC;
  TestNetworkC.Timer -> TimerMilliC;
  TestNetworkC.DisseminationPeriod -> Object16C;
  TestNetworkC.Send -> CollectionSenderC;
  TestNetworkC.ReadSensor -> DemoSensorC;
  TestNetworkC.RootControl -> Collector;
  TestNetworkC.Receive -> Collector.Receive[CL_TEST];
  TestNetworkC.UARTSend -> SerialAMSenderC.AMSend;
  TestNetworkC.CollectionPacket -> Collector;
  TestNetworkC.CtpInfo -> Collector;
  TestNetworkC.Random -> RandomC;

  components new PoolC(message_t, 10) as DebugMessagePool;
  components new QueueC(message_t*, 10) as DebugSendQueue;
  DebugSender.Boot -> MainC;
  DebugSender.UARTSend -> UARTSender;
  DebugSender.MessagePool -> DebugMessagePool;
  DebugSender.SendQueue -> DebugSendQueue;
  Collector.CollectionDebug -> DebugSender;
}
