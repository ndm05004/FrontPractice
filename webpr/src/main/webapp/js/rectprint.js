/**
 * 
 */

 
function printInfo(obj, out){


	str = `가로 : ${obj.width} <br>`;
	str += `세로 : ${obj.height} <br>`;
	str += `이름 : ${obj.name} <br>`;
	str += `면적 : ${obj.getArea()} <br>`;
	str += `둘레 : ${obj.getCircum()} <br>`;
		
	document.getElementById(out).innerHTML = str;
}
