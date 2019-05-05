 echo "Processing...."

# python3 AH_SnoopableFIFO.py  fifowidth   fifodepth    snoopwidth   path_of_yaml    bus_name
python3 AH_SnoopableFIFO.py 110 86 32       /home/mayukhs/Documents/smartasic2/refbuses/astob.yaml              astob
python3 AH_SnoopableFIFO.py 132 20 16     /home/mayukhs/Documents/smartasic2/refbuses/astob.yaml              astob
python3 AH_SnoopableFIFO.py 164 48  3     /home/mayukhs/Documents/smartasic2/refbuses/astob.yaml              astob
python3 AH_SnoopableFIFO.py 140 78  3     /home/mayukhs/Documents/smartasic2/refbuses/astob.yaml              astob
python3 AH_SnoopableFIFO.py 10 86 32      /home/mayukhs/Documents/smartasic2/refbuses/astob.yaml              astob
python3 AH_SnoopableFIFO.py 32 20 16      /home/mayukhs/Documents/smartasic2/refbuses/astob.yaml              astob
python3 AH_SnoopableFIFO.py 64 48  3      /home/mayukhs/Documents/smartasic2/refbuses/astob.yaml              astob
python3 AH_SnoopableFIFO.py 40 78  3      /home/mayukhs/Documents/smartasic2/refbuses/astob.yaml              astob


#===========================================================================================================================================================
# Legacy commands - don't run it
#===========================================================================================================================================================
 #python3 LruArbiter2                            /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 #python3 LruArbiter2.py 10                      /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 #python3 LruArbiter2.py 10                      /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 #python3 LruArbiter2.py 10                      /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 #python3 LruArbiter2.py 10                      /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 #python3 LruArbiter2.py 10                      /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 #python3 LruArbiter2.py 10                      /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/uart.yaml               uart
 #python3 LruArbiter2.py 15                      /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 #python3 LruArbiter2.py 20                      /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 #python3 LruArbiter2.py 8                       /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 #python3 LruArbiter2.py                         /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 #python3 LruArbiter.py 10                       /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter
 #python3 LruArbiter.py 10                       /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob

 #python3 Snoopable_FIFO_ma.py 10 16 32          /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 #python3 Snoopable_FIFO_ma.py 10                /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 #python3 Snoopable_FIFO_ma.py 20  40  50        /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 #python3 Snoopable_FIFO_ma.py 30  60  70        /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 #python3 Snoopable_FIFO_ma.py                   /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/astob.yaml              astob
 #python3 Snoopable_FIFO.py 10 10 32             /Documents/scratch_area/soumyajitp2/smartasic2/refbuses/arbiter.yaml            arbiter


echo "Done"
