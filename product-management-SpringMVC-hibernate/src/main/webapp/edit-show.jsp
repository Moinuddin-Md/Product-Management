<%@ include file='menu.jsp'  %>
<html>
 <body>
  <form action='update-product' method="post">
  	<table class='tar' border='1' cellpadding='8px'>
	 <tr style='background-color:orange;color:white;font-size:25px'>
	   <th colspan="2">Product details</th>
	</tr>
	 <tr>
		  <th align="left">Product id</th>
		  <td>
		  	 ${product.pid}		
		 	 <input type='hidden' name='pid' value='${product.pid}' width='100%'>
		  </td>
	 </tr>
	 <tr>
		  <th align="left">Product name</th>
		  <td><input type='text' name='name' value='${product.name}' width='100%'></td>
	 </tr>
	 <tr>
		  <th align="left">Product brand</th>
	 	  <td><input type='text' name='brand' value='${product.brand}' width='100%'></td>
	 </tr>
	 <tr>
		  <th align="left">Product price</th>
		  <td><input type='number' name='price' value='${product.price}' width='100%'></td>
	 </tr>
	 <tr>
	 	<td  class='tdp' colspan="2" align="center">
	 		<button  class='bt'>Update Record</button>
	 	</td>
	 </tr>
  </table>
  </form>
 </body>
</html>