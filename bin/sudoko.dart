import 'dart:io';

int count = 0;
int c=100;
List<List<List<int>>> a  =[ [[0],[0],[0],[0],[0],[0],[0],[0],[0]],[[0],[0],[0],[0],[0],[0],[0],[0],[0]],[[0],[0],[0],[0],[0],[0],[0],[0],[0]],[[0],[0],[0],[0],[0],[0],[0],[0],[0]],[[0],[0],[0],[0],[0],[0],[0],[0],[0]],[[0],[0],[0],[0],[0],[0],[0],[0],[0]],[[0],[0],[0],[0],[0],[0],[0],[0],[0]],[[0],[0],[0],[0],[0],[0],[0],[0],[0]],[[0],[0],[0],[0],[0],[0],[0],[0],[0]],];
int length = 0;
void main(List<String> arguments) {
  print('Hello world!');
  for(int i = 0;i<9;i++){
    for(int j= 0;j<9;j++){
   int? temp =  int.parse(stdin.readLineSync()!);
   if(temp ==0){
     count++;
   }
   print("count $count");
    a[i][j][0] = temp;
    }
  }

  //DISPLAY
 for(int i = 0;i<9;i++){
   print("");
   for(int j =0 ;j<9;j++){
     if(a[i][j].length==9){
       stdout.write("  ");
     }else{
      stdout.write("${a[i][j][0]} ");
     }
   }
 }

 while(count>0&&c>0){
   
   for(int k = 0;k<9;k++){
     for(int l = 0;l<9;l++){
      //  print("k,l $k $l");
       if(a[k][l].length>1||a[k][l][0]==0){
        check(k,l);
         if(length==1){
           count--;
         }
        
       }
     }
   }
   c--;
 }
 print("DISPLAY AFTER");
 for(int i = 0;i<9;i++){
   print("");
   for(int j =0 ;j<9;j++){
     if(a[i][j][0]==0){
       stdout.write("  ");
     }else{
      stdout.write("${a[i][j][0]} ");

     }
   }
 }
}


 check(int x,int y){
  List<int> blockBaseLimit =  blockDefiner(x,y);
print("count : $count c: $c x:$x: {x} y:$y ");
  // print(blockBaseLimit);
  int xBase = blockBaseLimit[0];
 int xLimit = blockBaseLimit[1];
int  yBase = blockBaseLimit[2];
 int yLimit = blockBaseLimit[3];
 a[x][y] = [1,2,3,4,5,6,7,8,9];
for(int i = xBase;i<=xLimit;i++){
for(int j =yBase;j<=yLimit;j++){
  if(a[i][j].length==1&&(i!=x||j!=y)){
    a[x][y].remove(a[i][j][0]);
  }
}
}

for(int i = 0;i<9;i++){
  if(a[i][y].length==1){
    if(i!=x){
    a[x][y].remove(a[i][y][0]);
    }
  }
}
print("--");
for(int i = 0;i<9;i++){
  if(a[x][i].length==1){
    if(i!=y){


    a[x][y].remove(a[x][i][0]);

  }
}
}
print(a[x][y]);
length = a[x][y].length;
}



List<int> blockDefiner(int i,int j){
if(i<3){
  if(j<3){
    return [0,2,0,2];
}else if(j<6){
    return [0,2,3,5];
}else if(j<9){
    return [0,2,6,8];
}
}else if(i<6){
  if(j<3){
    return [3,5,0,2];
}else if(j<6){
    return [3,5,3,5];
}else if(j<9){
    return [3,5,6,8];
}
}else if(i<9){

if(j<3){
    return [6,8,0,2];
}else if(j<6){
    return [6,8,3,5];
}else if(j<9){
    return [6,8,6,8];
}
}
return([]);
}
//T1
// 3
// 5
// 0
// 0
// 2
// 0
// 0
// 0
// 0
// 0
// 7
// 0
// 9
// 3
// 0
// 8
// 6
// 0
// 0
// 0
// 0
// 7
// 0
// 0
// 3
// 2
// 4
// 2
// 0
// 0
// 0
// 1
// 0
// 6
// 9
// 8
// 0
// 1
// 8
// 0
// 0
// 0
// 5
// 4
// 0
// 5
// 6
// 4
// 0
// 8
// 0
// 0
// 0
// 7
// 6
// 4
// 5
// 0
// 0
// 2
// 0
// 0
// 0
// 0
// 2
// 3
// 0
// 9
// 5
// 0
// 7
// 0
// 0
// 0
// 0
// 0
// 4
// 0
// 0
// 5
// 6


//T2
// 8
// 1
// 2
// 9
// 0
// 0
// 0
// 0
// 0
// 0
// 0
// 0
// 8
// 5
// 1
// 6
// 0
// 3
// 3
// 6
// 0
// 7
// 0
// 4
// 9
// 0
// 8
// 5
// 8
// 4
// 1
// 6
// 9
// 7
// 0
// 0
// 0
// 3
// 7
// 2
// 0
// 5
// 0
// 4
// 9
// 2
// 0
// 1
// 4
// 7
// 3
// 5
// 8
// 6
// 9
// 0
// 0
// 0
// 1
// 8
// 0
// 5
// 0
// 1
// 2
// 0
// 5
// 9
// 7
// 3
// 6
// 0
// 0
// 0
// 0
// 6
// 4
// 0
// 0
// 0
// 1


// T3
// 0
// 9
// 0
// 0
// 0
// 0
// 0
// 0
// 4
// 0
// 0
// 4
// 0
// 0
// 0
// 1
// 0
// 5
// 8
// 6
// 0
// 0
// 0
// 0
// 0
// 2
// 0
// 0
// 0
// 0
// 0
// 7
// 0
// 2
// 0
// 0
// 4
// 0
// 0
// 3
// 0
// 0
// 0
// 0
// 0
// 0
// 0
// 0
// 5
// 0
// 8
// 0
// 9
// 7
// 0
// 0
// 1
// 2
// 3
// 6
// 0
// 0
// 0
// 0
// 2
// 3
// 9
// 5
// 0
// 7
// 0
// 0
// 0
// 0
// 0
// 0
// 0
// 0
// 0
// 0
// 0
