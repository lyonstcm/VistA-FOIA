BGPM5BBF ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON SEP 12, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"66267048420 ")
 ;;5819
 ;;21,"66267048430 ")
 ;;5820
 ;;21,"66267048440 ")
 ;;5821
 ;;21,"66267048445 ")
 ;;5822
 ;;21,"66267048450 ")
 ;;5823
 ;;21,"66267048460 ")
 ;;5824
 ;;21,"66267048810 ")
 ;;5825
 ;;21,"66267048815 ")
 ;;5826
 ;;21,"66267048820 ")
 ;;5827
 ;;21,"66267048830 ")
 ;;5828
 ;;21,"66267048840 ")
 ;;5829
 ;;21,"66267048860 ")
 ;;5830
 ;;21,"66267048890 ")
 ;;5831
 ;;21,"66267052210 ")
 ;;5832
 ;;21,"66267052215 ")
 ;;5833
 ;;21,"66267052220 ")
 ;;5834
 ;;21,"66267052230 ")
 ;;5835
 ;;21,"66267052240 ")
 ;;5836
 ;;21,"66267056010 ")
 ;;5837
 ;;21,"66267056020 ")
 ;;5838
 ;;21,"66267056030 ")
 ;;5839
 ;;21,"66267056040 ")
 ;;5840
 ;;21,"66267056060 ")
 ;;5841
 ;;21,"66267056090 ")
 ;;5842
 ;;21,"66267057620 ")
 ;;5843
 ;;21,"66267057630 ")
 ;;5844
 ;;21,"66267057640 ")
 ;;5845
 ;;21,"66267057660 ")
 ;;5846
 ;;21,"66267057690 ")
 ;;5847
 ;;21,"66267058710 ")
 ;;5848
 ;;21,"66267058720 ")
 ;;5849
 ;;21,"66267058730 ")
 ;;5850
 ;;21,"66267058740 ")
 ;;5851
 ;;21,"66267058760 ")
 ;;5852
 ;;21,"66267067430 ")
 ;;5853
 ;;21,"66267072130 ")
 ;;5854
 ;;21,"66267072160 ")
 ;;5855
 ;;21,"66267072430 ")
 ;;5856
 ;;21,"66267100600 ")
 ;;5857
 ;;21,"66336000430 ")
 ;;5858
 ;;21,"66336000460 ")
 ;;5859
 ;;21,"66336000490 ")
 ;;5860
 ;;21,"66336001428 ")
 ;;5861
 ;;21,"66336001430 ")
 ;;5862
 ;;21,"66336001460 ")
 ;;5863
 ;;21,"66336002730 ")
 ;;5864
 ;;21,"66336002760 ")
 ;;5865
 ;;21,"66336002790 ")
 ;;5866
 ;;21,"66336022430 ")
 ;;5867
 ;;21,"66336027130 ")
 ;;5868
 ;;21,"66336035430 ")
 ;;5869
 ;;21,"66336035460 ")
 ;;5870
 ;;21,"66336035490 ")
 ;;5871
 ;;21,"66336041830 ")
 ;;5872
 ;;21,"66336062028 ")
 ;;5873
 ;;21,"66336062030 ")
 ;;5874
 ;;21,"66336062060 ")
 ;;5875
 ;;21,"66336062090 ")
 ;;5876
 ;;21,"66336062130 ")
 ;;5877
 ;;21,"66336062160 ")
 ;;5878
 ;;21,"66336067330 ")
 ;;5879
 ;;21,"66336067350 ")
 ;;5880
 ;;21,"66336067360 ")
 ;;5881
 ;;21,"66336075730 ")
 ;;5882
 ;;21,"66336075760 ")
 ;;5883
 ;;21,"66336075790 ")
 ;;5884
 ;;21,"66336079930 ")
 ;;5885
 ;;21,"66336079960 ")
 ;;5886
 ;;21,"66336083814 ")
 ;;5887
 ;;21,"66336083830 ")
 ;;5888
 ;;21,"66336084430 ")
 ;;5889
 ;;21,"66336084490 ")
 ;;5890
 ;;21,"66336097360 ")
 ;;5891
 ;;21,"66336099330 ")
 ;;5892
 ;;21,"66336099390 ")
 ;;5893
 ;;21,"66406003202 ")
 ;;5894
 ;;21,"66406003303 ")
 ;;5895
 ;;21,"66406003404 ")
 ;;5896
 ;;21,"66406003505 ")
 ;;5897
 ;;21,"66893003201 ")
 ;;5898
 ;;21,"66893028008 ")
 ;;5899
 ;;21,"66893028108 ")
 ;;5900
 ;;21,"66893028202 ")
 ;;5901
 ;;21,"66993070930 ")
 ;;5902
 ;;21,"66993071130 ")
 ;;5903
 ;;21,"66993071230 ")
 ;;5904
 ;;21,"67046001030 ")
 ;;5905
 ;;21,"67046001130 ")
 ;;5906
 ;;21,"67046001230 ")
 ;;5907
 ;;21,"67046001330 ")
 ;;5908
 ;;21,"67046001430 ")
 ;;5909
 ;;21,"67046001530 ")
 ;;5910
 ;;21,"67046001630 ")
 ;;5911
 ;;21,"67046001730 ")
 ;;5912
 ;;21,"67046010730 ")
 ;;5913
 ;;21,"67046010830 ")
 ;;5914
 ;;21,"67046010930 ")
 ;;5915
 ;;21,"67046011030 ")
 ;;5916
 ;;21,"67046011130 ")
 ;;5917
 ;;21,"67046011230 ")
 ;;5918
 ;;21,"67046011330 ")
 ;;5919
 ;;21,"67046011430 ")
 ;;5920
 ;;21,"67046011530 ")
 ;;5921
 ;;21,"67046011630 ")
 ;;5922
 ;;21,"67046021030 ")
 ;;5923
 ;;21,"67046021060 ")
 ;;5924
 ;;21,"67046021130 ")
 ;;5925
 ;;21,"67046021160 ")
 ;;5926
 ;;21,"67046021230 ")
 ;;5927
 ;;21,"67046021260 ")
 ;;5928
 ;;21,"67046048130 ")
 ;;5929
 ;;21,"67046048230 ")
 ;;5930
 ;;21,"67046048330 ")
 ;;5931
 ;;21,"67046053030 ")
 ;;5932
 ;;21,"67046053130 ")
 ;;5933
 ;;21,"67046053230 ")
 ;;5934
 ;;21,"67046053330 ")
 ;;5935
 ;;21,"67046066530 ")
 ;;5936
 ;;21,"67046073930 ")
 ;;5937
 ;;21,"67046074030 ")
 ;;5938
 ;;21,"67046074130 ")
 ;;5939
 ;;21,"67046074230 ")
 ;;5940
 ;;21,"67228000703 ")
 ;;5941
 ;;21,"67228000706 ")
 ;;5942
 ;;21,"67228006803 ")
 ;;5943
 ;;21,"67228006806 ")
 ;;5944
 ;;21,"67228006903 ")
 ;;5945
 ;;21,"67228006906 ")
 ;;5946
 ;;21,"67228014003 ")
 ;;5947
 ;;21,"67228014006 ")
 ;;5948
 ;;21,"67228021703 ")
 ;;5949
 ;;21,"67228021706 ")
 ;;5950
 ;;21,"67228021803 ")
 ;;5951
 ;;21,"67228021806 ")
 ;;5952
 ;;21,"67228021903 ")
 ;;5953
 ;;21,"67228021906 ")
 ;;5954
 ;;21,"67228023203 ")
 ;;5955
 ;;21,"67228023206 ")
 ;;5956
 ;;21,"67228023403 ")
 ;;5957
 ;;21,"67228023406 ")
 ;;5958
 ;;21,"67228025103 ")
 ;;5959
 ;;21,"67228025106 ")
 ;;5960
 ;;21,"67228025203 ")
 ;;5961
 ;;21,"67228025206 ")
 ;;5962
 ;;21,"67228025303 ")
 ;;5963
 ;;21,"67228025306 ")
 ;;5964
 ;;21,"67228025403 ")
 ;;5965
 ;;21,"67228025406 ")
 ;;5966
 ;;21,"67228026003 ")
 ;;5967
 ;;21,"67228026006 ")
 ;;5968
 ;;21,"67228026203 ")
 ;;5969
 ;;21,"67228026206 ")
 ;;5970
 ;;21,"67228026303 ")
 ;;5971
 ;;21,"67228026306 ")
 ;;5972
 ;;21,"67228026603 ")
 ;;5973
 ;;21,"67228026606 ")
 ;;5974
 ;;21,"67228027403 ")
 ;;5975
 ;;21,"67228027406 ")
 ;;5976
 ;;21,"67228030803 ")
 ;;5977
 ;;21,"67228030806 ")
 ;;5978
 ;;21,"67228031003 ")
 ;;5979
 ;;21,"67228031006 ")
 ;;5980
 ;;21,"67228032403 ")
 ;;5981
 ;;21,"67228032406 ")
 ;;5982
 ;;21,"67228032503 ")
 ;;5983
 ;;21,"67228032506 ")
 ;;5984
 ;;21,"67228033003 ")
 ;;5985
 ;;21,"67228033006 ")
 ;;5986
 ;;21,"67228033403 ")
 ;;5987
 ;;21,"67228033406 ")
 ;;5988
 ;;21,"67228034603 ")
 ;;5989
 ;;21,"67228034606 ")
 ;;5990
 ;;21,"67228035103 ")
 ;;5991
 ;;21,"67228035106 ")
 ;;5992
 ;;21,"67228035503 ")
 ;;5993
 ;;21,"67228035506 ")
 ;;5994
 ;;21,"67228041903 ")
 ;;5995
 ;;21,"67228041906 ")
 ;;5996
 ;;21,"67228043203 ")
 ;;5997
 ;;21,"67228043206 ")
 ;;5998
 ;;21,"67228043303 ")
 ;;5999
 ;;21,"67228043306 ")
 ;;6000
 ;;21,"67228045503 ")
 ;;6001
 ;;21,"67228045506 ")
 ;;6002
 ;;21,"67228046103 ")
 ;;6003
 ;;21,"67228046106 ")
 ;;6004
 ;;21,"67228047603 ")
 ;;6005
 ;;21,"67228047606 ")
 ;;6006
 ;;21,"67228047703 ")
 ;;6007
 ;;21,"67228047706 ")
 ;;6008
 ;;21,"67253070006 ")
 ;;6009
 ;;21,"67253070106 ")
 ;;6010
 ;;21,"67263010901 ")
 ;;6011
 ;;21,"67263027901 ")
 ;;6012
 ;;21,"67263049801 ")
 ;;6013
 ;;21,"67263060090 ")
 ;;6014
 ;;21,"67296029501 ")
 ;;6015
 ;;21,"67296038201 ")
 ;;6016
 ;;21,"67296038801 ")
 ;;6017
 ;;21,"67296038802 ")
 ;;6018
 ;;21,"67296068301 ")
 ;;6019
 ;;21,"67544007830 ")
 ;;6020
 ;;21,"67544007853 ")
 ;;6021
 ;;21,"67544007860 ")
 ;;6022
 ;;21,"67544007870 ")
 ;;6023
 ;;21,"67544007880 ")
 ;;6024
 ;;21,"67544007892 ")
 ;;6025
 ;;21,"67544008530 ")
 ;;6026
 ;;21,"67544008532 ")
 ;;6027
 ;;21,"67544008553 ")
 ;;6028
 ;;21,"67544008560 ")
 ;;6029
 ;;21,"67544008570 ")
 ;;6030
 ;;21,"67544008575 ")
 ;;6031
 ;;21,"67544008580 ")
 ;;6032
 ;;21,"67544013520 ")
 ;;6033
 ;;21,"67544013530 ")
 ;;6034
 ;;21,"67544013553 ")
 ;;6035
 ;;21,"67544013560 ")
 ;;6036
 ;;21,"67544013570 ")
 ;;6037
 ;;21,"67544015815 ")
 ;;6038
 ;;21,"67544015830 ")
 ;;6039
 ;;21,"67544015860 ")
 ;;6040
 ;;21,"67544016230 ")
 ;;6041
 ;;21,"67544016232 ")
 ;;6042
 ;;21,"67544016253 ")
 ;;6043
 ;;21,"67544016260 ")
 ;;6044
 ;;21,"67544016915 ")
 ;;6045
 ;;21,"67544016930 ")
 ;;6046
 ;;21,"67544016931 ")
 ;;6047
 ;;21,"67544016932 ")
 ;;6048
 ;;21,"67544016933 ")
 ;;6049
 ;;21,"67544016945 ")
 ;;6050
 ;;21,"67544016953 ")
 ;;6051
 ;;21,"67544020630 ")
 ;;6052
 ;;21,"67544020660 ")
 ;;6053
 ;;21,"67544023515 ")
 ;;6054
 ;;21,"67544023530 ")
 ;;6055
 ;;21,"67544023545 ")
 ;;6056
 ;;21,"67544025330 ")
 ;;6057
 ;;21,"67544025332 ")
 ;;6058
 ;;21,"67544025360 ")
 ;;6059
 ;;21,"67544025370 ")
 ;;6060
 ;;21,"67544029530 ")
 ;;6061
 ;;21,"67544029531 ")
 ;;6062
 ;;21,"67544029532 ")
 ;;6063
 ;;21,"67544029553 ")
 ;;6064
 ;;21,"67544029560 ")
 ;;6065
 ;;21,"67544029570 ")
 ;;6066
 ;;21,"67544029580 ")
 ;;6067
 ;;21,"67544031615 ")
 ;;6068
 ;;21,"67544031630 ")
 ;;6069
 ;;21,"67544031631 ")
 ;;6070
 ;;21,"67544031632 ")
 ;;6071
 ;;21,"67544031645 ")
 ;;6072
 ;;21,"67544031653 ")
 ;;6073
 ;;21,"67544031660 ")
 ;;6074
 ;;21,"67544031670 ")
 ;;6075
 ;;21,"67544031715 ")
 ;;6076
 ;;21,"67544031730 ")
 ;;6077
 ;;21,"67544031732 ")
 ;;6078
 ;;21,"67544031753 ")
 ;;6079
 ;;21,"67544031760 ")
 ;;6080
 ;;21,"67544033130 ")
 ;;6081
 ;;21,"67544033153 ")
 ;;6082
 ;;21,"67544033160 ")
 ;;6083
 ;;21,"67544035715 ")
 ;;6084
 ;;21,"67544035730 ")
 ;;6085
 ;;21,"67544035745 ")
 ;;6086
 ;;21,"67544035753 ")
 ;;6087
 ;;21,"67544035815 ")
 ;;6088
 ;;21,"67544035830 ")
 ;;6089
 ;;21,"67544035860 ")
 ;;6090
 ;;21,"67544036015 ")
 ;;6091
 ;;21,"67544036030 ")
 ;;6092
 ;;21,"67544036045 ")
 ;;6093
 ;;21,"67544036053 ")
 ;;6094
 ;;21,"67544036060 ")
 ;;6095
 ;;21,"67544036073 ")
 ;;6096
 ;;21,"67544036515 ")
 ;;6097
 ;;21,"67544036530 ")
 ;;6098
 ;;21,"67544036553 ")
 ;;6099
 ;;21,"67544036560 ")
 ;;6100
 ;;21,"67544036615 ")
 ;;6101
 ;;21,"67544036630 ")
 ;;6102
 ;;21,"67544036645 ")
 ;;6103
 ;;21,"67544036653 ")
 ;;6104
 ;;21,"67544036660 ")
 ;;6105
 ;;21,"67544036673 ")
 ;;6106
 ;;21,"67544040915 ")
 ;;6107
 ;;21,"67544040930 ")
 ;;6108
 ;;21,"67544040932 ")
 ;;6109
 ;;21,"67544040945 ")
 ;;6110
 ;;21,"67544040953 ")
 ;;6111
 ;;21,"67544040960 ")
 ;;6112
 ;;21,"67544040973 ")
 ;;6113
 ;;21,"67544042915 ")
 ;;6114
 ;;21,"67544042930 ")
 ;;6115
 ;;21,"67544042931 ")
 ;;6116
 ;;21,"67544042932 ")
 ;;6117
 ;;21,"67544042960 ")
 ;;6118
 ;;21,"67544043015 ")
 ;;6119
 ;;21,"67544043030 ")
 ;;6120
 ;;21,"67544043031 ")
 ;;6121
 ;;21,"67544043045 ")
 ;;6122
 ;;21,"67544043053 ")
 ;;6123
 ;;21,"67544043415 ")
 ;;6124
 ;;21,"67544043430 ")
 ;;6125
 ;;21,"67544043445 ")
 ;;6126
 ;;21,"67544045515 ")
 ;;6127
 ;;21,"67544045530 ")
 ;;6128
 ;;21,"67544045553 ")
 ;;6129
 ;;21,"67544045560 ")
 ;;6130
 ;;21,"67544050015 ")
 ;;6131
 ;;21,"67544050030 ")
 ;;6132
 ;;21,"67544050053 ")
 ;;6133
 ;;21,"67544050060 ")
 ;;6134
 ;;21,"67544051631 ")
 ;;6135
 ;;21,"67544052830 ")
 ;;6136
 ;;21,"67544052832 ")
 ;;6137
 ;;21,"67544052853 ")
 ;;6138
 ;;21,"67544052860 ")
 ;;6139
 ;;21,"67544052870 ")
 ;;6140
 ;;21,"67544052880 ")
 ;;6141
 ;;21,"67544052892 ")
 ;;6142
 ;;21,"67544053731 ")
 ;;6143
 ;;21,"67544057215 ")
 ;;6144
 ;;21,"67544057230 ")
 ;;6145
 ;;21,"67544057231 ")
 ;;6146
 ;;21,"67544057232 ")
 ;;6147
 ;;21,"67544057245 ")
 ;;6148
 ;;21,"67544057253 ")
 ;;6149
 ;;21,"67544057260 ")
 ;;6150
 ;;21,"67544057270 ")
 ;;6151
 ;;21,"67544057280 ")
 ;;6152
 ;;21,"67544057292 ")
 ;;6153
 ;;21,"67544058815 ")
 ;;6154
 ;;21,"67544058830 ")
 ;;6155
 ;;21,"67544058845 ")
 ;;6156
 ;;21,"67544058853 ")
 ;;6157
 ;;21,"67544058860 ")
 ;;6158
 ;;21,"67544061730 ")
 ;;6159
 ;;21,"67544061732 ")
 ;;6160
 ;;21,"67544064815 ")
 ;;6161
 ;;21,"67544064831 ")
 ;;6162
 ;;21,"67544064832 ")
 ;;6163
 ;;21,"67544064845 ")
 ;;6164
 ;;21,"67544065231 ")
 ;;6165
 ;;21,"67544066431 ")
 ;;6166
 ;;21,"67544066432 ")
 ;;6167
 ;;21,"67544071831 ")
 ;;6168
 ;;21,"67544072831 ")
 ;;6169
 ;;21,"67544072832 ")
 ;;6170