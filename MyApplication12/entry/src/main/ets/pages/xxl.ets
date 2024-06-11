import http from '@ohos.net.http';
import router from '@ohos.router';
import curves from '@ohos.curves';
@Entry
@Component
struct Index {
  @State nihao:Visibility=Visibility.Hidden
  @State jsq:number=0;
  @State jsq1:number=0;
  @State translateX: number = 0;
  @State selectedImageId: number = -1;
  @State toggle: boolean = true
  @State csh:Array<String>=["../../resources/base/media/1.1.gif","../../resources/base/media/2.1.gif","../../resources/base/media/3.1.gif","../../resources/base/media/4.1.gif","../../resources/base/media/5.1.gif","../../resources/base/media/6.1.gif","../../resources/base/media/7.1.gif","../../resources/base/media/8.1.gif","../../resources/base/media/9.1.gif","../../resources/base/media/10.1.gif",]
  @State cc:Array<Resource>=[$r('app.media.11'),$r('app.media.22'),$r('app.media.33'),$r('app.media.44'),$r('app.media.55'),$r('app.media.66'),$r('app.media.77'),$r('app.media.88'),$r('app.media.99'),$r('app.media.101')]
  @State dt:Array<Resource>=[$r('app.media.1'),$r('app.media.2'),$r('app.media.3'),$r('app.media.4'),$r('app.media.5'),$r('app.media.6'),$r('app.media.7'),$r('app.media.8'),$r('app.media.9'),$r('app.media.10')]
  @State bj:Array<Resource>=[$r('app.media.bj1'),$r('app.media.bj2'),$r('app.media.bj3'),$r('app.media.bj4'),$r('app.media.bj5')]

  jis:Array<number>=[0,0,0,0,0,0,0,0,0,0,0,0]
  @State on:Array<Array<Resource>>=new Array(16).fill(null).map(() => {
    return new Array(7).fill(null).map(() => {
      let i=Math.floor(Math.random() * 10)
      console.log("======="+i);
      console.log("=====jis"+this.jis[i]);
      if(this.jis[11]>102){
        this.jis[11]++
        for(let j=0;j<10;j++){
          if(this.jis[j]%2==1){
            this.jis[j]=this.jis[j]+1
            return this.cc[j];
          }
        }
      }
      this.jis[11]++
      this.jis[i]=this.jis[i]+1
      return this.cc[i];
    });
  });
  private xsgz:Array<Array<Visibility>>=[[Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
    [Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible,Visibility.Visible],
  ]
  private xsgz1:Visibility=Visibility.None


  @State  ydx: Array<Array<number>> = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],

  ];
  private ydy: Array<Array<number>> = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
  ];
  private pp:Number=0
  private on2: String =''

  build() {
    Column() {
      Text("您使用了\n"+this.jsq+"s"+"\n完成了游戏"+"\n请自行返回主页")
        .width(300)
        .height(250)
        .position({x:30,y:150})
        .visibility(this.nihao)
        .zIndex(1000)
        .fontSize(40)
        .textAlign(TextAlign.Center)
      ForEach(this.on, (row, rowIndex) => {
        Row() {
          ForEach(row, (image, colIndex) => {
            Flex({
              direction: FlexDirection.Column,
              alignItems: ItemAlign.Center,
              justifyContent: FlexAlign.Center
            }) {
              Image(this.on[rowIndex][colIndex])
                .width(50)
                .height(50)
                .borderWidth(1)
                .borderColor(Color.Black)
                .opacity(this.isHighlight(rowIndex * 10 + colIndex) ? 1 : 1)
                .onClick(() => this.onImageClick(rowIndex, colIndex))
                .visibility(this.xsgz[rowIndex][colIndex])
                .translate({ x: this.ydx[rowIndex][colIndex] })
            }
            .width(50)
            .height(50)
          })
        }
      })

    }
    .backgroundImage(this.bjtp())
    .backgroundImageSize({ width: '100%', height: '100%' })
    .margin({ top: 10, left:25})

  }
xyj(){
  router.back({url:'pages/index'});
}
bjtp(){
  return this.bj[Math.floor(Math.random() * 5)]
}
  isHighlight(id: number): boolean {
    return this.selectedImageId === id;
  }
  onImageClick(row: number, col: number) {
    var that=this
    if(that.jsq1==0){
      var intervalID = setInterval(function() {
        that.jsq=that.jsq+1
        let pl=0
        for(let i=0;i<16;i++){
          for(let j=0;j<7;j++){
            if(that.xsgz[i][j]==Visibility.Visible){
              pl=1
            }
          }
        }
        if(pl==0){
          clearInterval(intervalID);
          that.nihao=Visibility.Visible
        }
      }, 1000);
      that.jsq1=1;
    }
    for(let j=0;j<10;j++){
      if(this.on[row][col]==this.cc[j]){
        this.on[row][col]=this.dt[j]
      }
    }
    console.log("row="+row+" col="+col)
    const id = row * 10 + col;
    if (this.selectedImageId === -1) {
      this.selectedImageId = id;
    } else {
      const selectedRow = Math.floor(this.selectedImageId / 10);
      const selectedCol = this.selectedImageId % 10;
      if(this.on[selectedRow][selectedCol]==this.on[row][col] && (selectedRow!=row ||  selectedCol!=col)){
        this.xsgz[selectedRow][selectedCol]=Visibility.Hidden
        this.xsgz[row][col]=Visibility.Hidden
        console.log("=======");
      }
      else{
        console.log("=======失败");
        for(let j=0;j<10;j++){
          if(this.on[row][col]==this.dt[j]){
            this.on[row][col]=this.cc[j]
          }
          if(this.on[selectedRow][selectedCol]==this.dt[j]){
            this.on[selectedRow][selectedCol]=this.cc[j]
          }
        }
        this.selectedImageId=-1

      }
      this.selectedImageId = -1;

    }


  }

}
function getElementById(arg0: string) {
  throw new Error('Function not implemented.');
}
