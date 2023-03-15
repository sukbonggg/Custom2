 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    text-align: center;
}
hr {
    width: 500px; 
}

#title {
    font-size: 36px; 
    font-weight: bold;
    letter-spacing: 2px;
}

#board {
    width: 350px;
    height: 420 px;
    margin: 100px auto;
    margin-top: 3px;
    display: flex;
    flex-wrap: wrap;
}

.tile {
    /* box */
    border: 2px solid lightgrey;
    width: 50px;
    height: 50px;
    margin: 2.5px;

    /* text */
    color: black;
    font-size: 36px;
    font-weight: bold;
    display: flex;
    justify-content: center;
    align-items: center;
}
.correct {
    background-color: #619978;
    color: white;
    border-color: white;
}

.present {
    background-color: #C9B458;
    color: white;
    border-color: white;
}

.absent {
    background-color: #8d8f91;
    color: white;
    border-color: white
}
</style>
<%@include file="../main/header.jsp"%>



	<!-- MAIN -->
	<div class="main">
		<!-- MAIN CONTENT -->
		<div class="main-content">
			
        <h1 id="title">WORDLE</h1>
        <hr>
        <br>
        <div id="board">

        </div>

        <br>
        <h1 id="answer"></h1>
					</div>
				
			
	
   
	

					
	
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="../member/main" class="active"><i class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
						<li><a href="../board/listBoard" class=""><i class="lnr lnr-dice"></i> <span>Board</span></a></li>
						<li><a href="../jqgrid/jqGrid" class=""><i class="lnr lnr-text-format"></i> <span>JqGrid</span></a></li>
						<li><a href="../api/api" class=""><i class="lnr lnr-linearicons"></i> <span>API</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		

		</div>
</body>

<script>
let height = 6; // 줄 갯수 
let width = 6; // 단어 길이

let row = 0; // 현재 줄 (attempt #)
let col = 0; // 현재 알파벳 인덱스 

let gameOver = false;
let word = "STUPID";

window.onload = function() {
    initialize();
};

function initialize() {

    // 보드 만들기
    for (let r = 0; r < height; r++) {
        for (let c = 0; c < width; c++) {
            //<span id="0-0" class="tile"></span>
            let tile = document.createElement("span"); 
            tile.id = r.toString() + "-" + c.toString(); 
            tile.classList.add("tile");
            tile.innerText = "";
            document.getElementById("board").appendChild(tile); 
        }
    }
    
    document.addEventListener("keyup", (e) => {
    	if(gameOver) return; 
    	
    	if ("KeyA" <= e.code && e.code <= "KeyZ") {
    		  if (col < width) {
    		    let currTile = document.getElementById(row.toString() + "-" + col.toString());
    		    if (currTile.innerText === "") {
    		      currTile.innerText = e.code[3];
    		      col += 1;
    		    }
    		  }
    		}else if (e.code === "Backspace") {
    			  if (0 < col && col <= width) {
    				    col -= 1;
    				  }
    				  let currTile = document.getElementById(row.toString() + '-' + col.toString());
    				  currTile.innerText = "";
    				} else if (e.code === "Enter" && col === width) {
    					   update();
    					   row += 1; // start new row
    					   col = 0;  // start at 0 for new row
    					 }
    	  if (!gameOver && row === height) {
    		    gameOver = true;
    		    document.getElementById("answer").innerText = word;
    		  	}
    		  })

    		};
    		function update() {
    		    let correct = 0;
    		    for (let c = 0; c < width; c++) {
    		        let currTile = document.getElementById(row.toString() + '-' + c.toString());
    		        let letter = currTile.innerText;

    		        // letter가 맞는 자리에 있는가?
    		        if (word[c] === letter) {
    		            currTile.classList.add("correct");
    		            correct += 1;
    		        } // letter가 정답에 존재하는가? 
    		        else if (word.includes(letter)) {
    		            currTile.classList.add("present");
    		        } // letter 정답에 없음? 
    		        else {
    		            currTile.classList.add("absent");
    		        }
    				// 정답을 맞추면 게임오버 
    		        if (correct === width) {
    		            gameOver = true;
    		            document.getElementById("answer").innerText = "성공"+word;
    		        }
    		    }
    		};
</script>
		
</html>
