$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		/* For Select Box */
		var self_ = $('[name=' + this.name + ']');
		if (self_.is('select')) {
			this.value = common.getSelectBoxObject(this);
		}
		if (self_.hasClass("format-currency")) {
			this.value = self_.currency();
		}
		o[this.name] = this.value || '';
	});
	return o;
};
