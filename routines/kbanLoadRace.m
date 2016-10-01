kbanLoadRace(path,file) ; VEN/SMH - Load CDC/Race Ethnicity File
 S U="^"
 d OPEN^%ZISH("race",path,file,"R")
 d USE^%ZISUTL("race")
 N X
 N CNT S CNT=+$O(^VW(250001.2," "),-1)
 R X:1
 L +^VW(250001.2)
 F  R X:1  Q:$$STATUS^%ZISH()  S CNT=$I(CNT),^VW(250000000.001,CNT,0)=$P(X,U,1,4)
 D CLOSE^%ZISH("race")
 N DIK S DIK="^VW(250001.2" D IXALL^DIK
 L -^VW(250001.2)
 QUIT
