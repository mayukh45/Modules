 echo "Processing...."

## python3 AH_CAM.py  camdepth camwidth snoopwidth path_of_yaml bus_name
 python3 AH_CAM.py 10  16  8                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
  python3 AH_CAM.py 20  128 68                   /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
  python3 AH_CAM.py 50  64  35                   /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
  python3 AH_CAM.py 100 20  15                   /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
  python3 AH_CAM.py 110  16  8                   /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
  python3 AH_CAM.py 120  128 68                  /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
  python3 AH_CAM.py 150  64  35                  /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
  python3 AH_CAM.py 1100 20  15                  /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob

 #===========================================================================================================================================================
 ## TODO t obe done by either Soumyajit or Utkarsh or Mayukh
 #===========================================================================================================================================================
 ## python3 AH_CarryLookAheadAdder.py 0 8          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 ## python3 AH_CarryLookAheadAdder.py 0 8          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/math.yaml               adder
 ## python3 AH_CarryLookAheadAdder.py 1 8          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 ## python3 AH_CarryLookAheadAdder.py 1 8          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/math.yaml               adder

 ## python3 AH_DivPipelined.py  bits   stages  path_of_yaml   bus_name

 python3 AH_DivPipelined.py 100 20              /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/divpipelined.yaml       divpipelined
 python3 AH_DivPipelined.py 50 16               /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/divpipelined.yaml       divpipelined
 python3 AH_DivPipelined.py 10 32               /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/divpipelined.yaml       divpipelined
 python3 AH_DivPipelined.py 4 8                 /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/divpipelined.yaml       divpipelined
 python3 AH_DivPipelined.py 6 8                 /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/divpipelined.yaml       divpipelined
 python3 AH_DivPipelined.py 128 10              /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/divpipelined.yaml       divpipelined
 python3 AH_DivPipelined.py 64 10               /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/divpipelined.yaml       divpipelined

 # python3 AH_LruArbiter.py   num_clients   path_of_yaml    bus_name

 python3 AH_LruArbiter.py 200                   /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 40                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 12                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 35                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 16                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 27                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 18                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 32                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 4                     /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 64                    /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 7                     /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_LruArbiter.py 8                     /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter

 ##=== ##               #===========================================================================================================================================================
 ##=== ##               ##TODO: Soumyajit should start on it.
 ##=== ##               #===========================================================================================================================================================
 # python3 AH_PacketConverter.py  width1  width2  isW2N/isN2W     path_of_yaml   bus_name
 python3 AH_PacketConverter.py 10 15 True       /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml               astoc
 python3 AH_PacketConverter.py 10 15 False      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml               astoc
 python3 AH_PacketConverter.py 20 32 True       /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml               astoc
 python3 AH_PacketConverter.py 20 32 False       /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc

 # python3 AH_RoundRobinArbiter.py       num_clients     path_of_yaml    bus_name      weight=None/ or pass value
 python3 AH_RoundRobinArbiter.py 128            /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter 5
 python3 AH_RoundRobinArbiter.py 32             /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 python3 AH_RoundRobinArbiter.py 64             /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter 10
 python3 AH_RoundRobinArbiter.py 16             /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter 5
 python3 AH_RoundRobinArbiter.py 8             /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter

 # python3 AH_SnoopableFIFO.py  fifowidth   fifodepth    snoopwidth   path_of_yaml    bus_name
 python3 AH_SnoopableFIFO.py 110 86 32          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
 python3 AH_SnoopableFIFO.py 132 20 16          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
 python3 AH_SnoopableFIFO.py 164 48  3          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
 python3 AH_SnoopableFIFO.py 140 78  3          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
 python3 AH_SnoopableFIFO.py 10 86 32           /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 python3 AH_SnoopableFIFO.py 32 20 16           /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 python3 AH_SnoopableFIFO.py 64 48  3           /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 python3 AH_SnoopableFIFO.py 40 78  3           /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob

#### ========
#### ======== #===========================================================================================================================================================
#### ======== # Legacy commands - don't run it
#### ======== #===========================================================================================================================================================
#### ========  #python3 LruArbiter2                            /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========  #python3 LruArbiter2.py 10                      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========  #python3 LruArbiter2.py 10                      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========  #python3 LruArbiter2.py 10                      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
#### ========  #python3 LruArbiter2.py 10                      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
#### ========  #python3 LruArbiter2.py 10                      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
#### ========  #python3 LruArbiter2.py 10                      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/uart.yaml               uart
#### ========  #python3 LruArbiter2.py 15                      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========  #python3 LruArbiter2.py 20                      /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========  #python3 LruArbiter2.py 8                       /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========  #python3 LruArbiter2.py                         /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========  #python3 LruArbiter.py 10                       /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========  #python3 LruArbiter.py 10                       /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
#### ========
#### ========  #python3 Snoopable_FIFO_ma.py 10 16 32          /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
#### ========  #python3 Snoopable_FIFO_ma.py 10                /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
#### ========  #python3 Snoopable_FIFO_ma.py 20  40  50        /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
#### ========  #python3 Snoopable_FIFO_ma.py 30  60  70        /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
#### ========  #python3 Snoopable_FIFO_ma.py                   /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/astoc.yaml              astoc
#### ========  #python3 Snoopable_FIFO.py 10 10 32             /sharedprojects/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
#### ========
#### ========
#### ======== echo "Done"
