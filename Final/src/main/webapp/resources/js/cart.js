var cartService=(function(){
	function add(cart, callback, error){
		$.ajax({
			type: "post",
			url:'/cart/new',
			data: JSON.stringify(cart),
			contentType : "application/json;charset=uft-8",
			success: function(result, status, xhr){
				if(callback){callback(result);}
			},
			error: function(xhr, status, er){
				if(error){error(er);}
			}
		})
	}
	function getList(userID, callback, error){
		var userId=userID;
		$.getJSON('/cart/list/'+userId+'.json',
			function(data){
				if(callback){ callback(data);}
				}).fail(function(xhr, status, err){
					if(error){error();}
				});
	}
	function remove(cID, callback, error){
		$.ajax({
			type: "delete",
			url: '/cart/'+cID,
			success: function(deleteResult, status, xhr){
				if(callback){callback(deleteResult);}
			},
			error: function(xhr, status,er){
				if(error){error(er);}
			}
		});
	}
	function update(cart, callback, error){
		console.log(cart);
		$.ajax({
			type: 'put',
			url : '/cart/'+cart.cid,
			data: JSON.stringify(cart),
			contentType: "application/json; charset=utf-8",
			success: function(result,status,xhr){
				if(callback){callback(result);}
			},
			error: function(xhr, status, er){
				if(error){error(er);}
			}
		});
	}
	function get(cart, callback,error){
		console.log("cart",cart);
		$.ajax({
			type: 'post',
			url:'/cart/get',
			data: JSON.stringify(cart),
			contentType:"application/json; charset=utf-8",
			success: function(result,status,xhr){
				console.log("get success");
				if(callback){callback(result);}
			},
			error: function(xhr, status, er){
				if(error){error(er);}
			}
		});
	}
	function getPro(proID, callback, error){
		$.ajax({
			type:'get',
			url:'/cart/getPro/'+proID,
			success: function(getProResult, status, xhr){
				if(callback){callback(getProResult);}
			},
			error: function(xhr, status,er){
				if(error){error(er);}
			}
		});
	}
	return {
		add:add,
		getList : getList,
		remove: remove,
		update: update,
		get:get,
		getPro:getPro
		};
})();