<c:if test="${user != null}">
	<!--[if lt IE 9]>
		<script src="../assets/js/ie8-responsive-file-warning.js"></script>
	<![endif]-->
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<!-- jQuery -->
	
	<script src="../js/countdown.js"></script> 
	
	<script src="../js/jquery.min.js"></script>
	<script src="../js/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../js/jquery-numeric.js"></script>
	<script>$(".numeric").numeric();</script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/nprogress.js"></script>
	<script src="../js/progressbar/bootstrap-progressbar.min.js"></script>
	<script src="../js/icheck/icheck.min.js"></script>
	<script src="../js/moment/moment.min.js"></script>
	<script src="../js/datepicker/daterangepicker.js"></script>
	<script src="../js/custom.js"></script>
	<script type="text/javascript"> 
	    (function($){
	        $(function(){
	            setInterval(function() {
	                var url = '#';
	                var num_subastas = document.getElementById("num_subastas").innerHTML;
	               	for (i = 1; i <= num_subastas; i++) {
	                	var id_puja = ('#rlpuja'+i);
	                	var id_pujador = ('#rlpujador'+i);
	                	$(id_puja).load(url + ' ' + id_puja + '_');
	                	$(id_pujador).load(url + ' ' + id_pujador + '_');
	               	}
	            }, 500);
	        }); 
	     })(jQuery);
    </script>
	<!-- Form validation -->
	<script type="text/javascript" src="../js/parsley/parsley.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$.listen('parsley:field:validate', function() {
				validateFront();
			});
			$('#demo-form .btn').on('click', function() {
				$('#demo-form').parsley().validate();
				validateFront();
			});
			var validateFront = function() {
				if (true === $('#demo-form').parsley().isValid()) {
					$('.bs-callout-info').removeClass('hidden');
					$('.bs-callout-warning').addClass('hidden');
				} else {
					$('.bs-callout-info').addClass('hidden');
					$('.bs-callout-warning').removeClass('hidden');
				}
			};
		});
		$(document).ready(function() {
			$.listen('parsley:field:validate', function() {
				validateFront();
			});
			$('#demo-form2 .btn').on('click', function() {
				$('#demo-form2').parsley().validate();
				validateFront();
			});
			var validateFront = function() {
				if (true === $('#demo-form2').parsley().isValid()) {
					$('.bs-callout-info').removeClass('hidden');
					$('.bs-callout-warning').addClass('hidden');
				} else {
					$('.bs-callout-info').addClass('hidden');
					$('.bs-callout-warning').removeClass('hidden');
				}
			};
		});
		try {
			hljs.initHighlightingOnLoad();
		} catch (err) {}
	</script>
	<!-- Buscador -->
	<script>
		$(document).ready(function() {
			$('input.tableflat').iCheck({
				checkboxClass: 'icheckbox_flat-green',
				radioClass: 'iradio_flat-green'
			});
		});
		var asInitVals = new Array();
		$(document).ready(function() {
			var oTable = $('#example').dataTable({
				"oLanguage": {
					"sSearch": "Buscar:"
				},
				"aoColumnDefs": [{
					'bSortable': false,
					'aTargets': [0]
					} //disables sorting for column one
					],
					'iDisplayLength': 12,
					"sPaginationType": "full_numbers",
					"dom": 'T<"clear">lfrtip',
					"tableTools": {
						"sSwfPath": "js/datatables/tools/swf/copy_csv_xls_pdf.swf"
					}
				});
			$("tfoot input").keyup(function() {
				/* Filter on the column based on the index of this element's parent <th> */
				oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
			});
			$("tfoot input").each(function(i) {
				asInitVals[i] = this.value;
			});
			$("tfoot input").focus(function() {
				if (this.className == "search_init") {
					this.className = "";
					this.value = "";
				}
			});
			$("tfoot input").blur(function(i) {
				if (this.value == "") {
					this.className = "search_init";
					this.value = asInitVals[$("tfoot input").index(this)];
				}
			});
		});
	</script>
	
	<script>
		$(document).ready(function() {
			// [17, 74, 6, 39, 20, 85, 7]
			// [82, 23, 66, 9, 99, 6, 2]
			var data1 = [
				[gd(2012, 1, 1), 17],
				[gd(2012, 1, 2), 74],
				[gd(2012, 1, 3), 6],
				[gd(2012, 1, 4), 39],
				[gd(2012, 1, 5), 20],
				[gd(2012, 1, 6), 85],
				[gd(2012, 1, 7), 7]
			];
			var data2 = [
				[gd(2012, 1, 1), 82],
				[gd(2012, 1, 2), 23],
				[gd(2012, 1, 3), 66],
				[gd(2012, 1, 4), 9],
				[gd(2012, 1, 5), 119],
				[gd(2012, 1, 6), 6],
				[gd(2012, 1, 7), 9]
			];
			$("#canvas_dahs").length && $.plot($("#canvas_dahs"), [
				data1, data2
				], {
					series: {
						lines: {
							show: false,
							fill: true
						},
						splines: {
							show: true,
							tension: 0.4,
							lineWidth: 1,
							fill: 0.4
						},
						points: {
							radius: 0,
							show: true
						},
						shadowSize: 2
					},
					grid: {
						verticalLines: true,
						hoverable: true,
						clickable: true,
						tickColor: "#d5d5d5",
						borderWidth: 1,
						color: '#fff'
					},
					colors: ["rgba(38, 185, 154, 0.38)", "rgba(3, 88, 106, 0.38)"],
					xaxis: {
						tickColor: "rgba(51, 51, 51, 0.06)",
						mode: "time",
						tickSize: [1, "day"],
						//tickLength: 10,
						axisLabel: "Date",
						axisLabelUseCanvas: true,
						axisLabelFontSizePixels: 12,
						axisLabelFontFamily: 'Verdana, Arial',
						axisLabelPadding: 10
						//mode: "time", timeformat: "%m/%d/%y", minTickSize: [1, "day"]
					},
					yaxis: {
						ticks: 8,
						tickColor: "rgba(51, 51, 51, 0.06)",
					},
					tooltip: false
				});
				function gd(year, month, day) {
					return new Date(year, month - 1, day).getTime();
				}
		});
	</script>
	
	<script src="../js/datatables/js/jquery.dataTables.js"></script>
	
	<!-- datepicker -->
	<script type="text/javascript">
		$(document).ready(function() {
			var cb = function(start, end, label) {
				console.log(start.toISOString(), end.toISOString(), label);
				$('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
					//alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
			}
			var optionSet1 = {
				startDate: moment().subtract(29, 'days'),
				endDate: moment(),
				minDate: '01/01/2012',
				maxDate: '12/31/2015',
				dateLimit: {
					days: 60
				},
				showDropdowns: true,
				showWeekNumbers: true,
				timePicker: false,
				timePickerIncrement: 1,
				timePicker12Hour: true,
				ranges: {
					'Today': [moment(), moment()],
					'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
					'Last 7 Days': [moment().subtract(6, 'days'), moment()],
					'Last 30 Days': [moment().subtract(29, 'days'), moment()],
					'This Month': [moment().startOf('month'), moment().endOf('month')],
					'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
				},
				opens: 'left',
				buttonClasses: ['btn btn-default'],
				applyClass: 'btn-small btn-primary',
				cancelClass: 'btn-small',
				format: 'MM/DD/YYYY',
				separator: ' to ',
				locale: {
					applyLabel: 'Submit',
					cancelLabel: 'Clear',
					fromLabel: 'From',
					toLabel: 'To',
					customRangeLabel: 'Custom',
					daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
					monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
					firstDay: 1
				}
			};
			$('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
			$('#reportrange').daterangepicker(optionSet1, cb);
			$('#reportrange').on('show.daterangepicker', function() {
				console.log("show event fired");
			});
			$('#reportrange').on('hide.daterangepicker', function() {
				console.log("hide event fired");
			});
			$('#reportrange').on('apply.daterangepicker', function(ev, picker) {
				console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
			});
			$('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
				console.log("cancel event fired");
			});
			$('#options1').click(function() {
				$('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
			});
			$('#options2').click(function() {
				$('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
			});
			$('#destroy').click(function() {
				$('#reportrange').data('daterangepicker').remove();
			});
		});
	</script>
	
	<script>NProgress.done();</script>
	
	<!-- tags -->
	<script src="../js/tags/jquery.tagsinput.min.js"></script>
	<!-- switchery -->
	<script src="../js/switchery/switchery.min.js"></script>
	<!-- richtext editor -->
	<script src="../js/editor/bootstrap-wysiwyg.js"></script>
	<script src="../js/editor/external/jquery.hotkeys.js"></script>
	<script src="../js/editor/external/google-code-prettify/prettify.js"></script>
	<!-- textarea resize -->
	<script src="../js/textarea/autosize.min.js"></script>
	<script>autosize($('.resizable_textarea'));</script>
	<!-- Autocomplete -->
	<script type="text/javascript" src="../js/autocomplete/countries.js"></script>
	<script src="../js/autocomplete/jquery.autocomplete.js"></script>
	<script type="text/javascript">
		$(function() {
			'use strict';
			var countriesArray = $.map(countries, function(value, key) {
				return {
					value: value,
					data: key
				};
			});
			// Initialize autocomplete with custom appendTo:
			$('#autocomplete-custom-append').autocomplete({
				lookup: countriesArray,
				appendTo: '#autocomplete-container'
			});
		});
	</script>
	<!-- input tags -->
	<script>
		function onAddTag(tag) {
			alert("Added a tag: " + tag);
		}
		function onRemoveTag(tag) {
			alert("Removed a tag: " + tag);
		}
		function onChangeTag(input, tag) {
			alert("Changed a tag: " + tag);
		}
		$(function() {
			$('#tags_1').tagsInput({
				width: 'auto'
			});
		});
	</script>
	<!-- editor -->
	<script>
		$(document).ready(function() {
			$('.xcxc').click(function() {
				$('#descr').val($('#editor').html());
			});
		});
		$(function() {
			function initToolbarBootstrapBindings() {
				var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
				'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
				'Times New Roman', 'Verdana'
				],
				fontTarget = $('[title=Font]').siblings('.dropdown-menu');
				$.each(fonts, function(idx, fontName) {
					fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
				});
				$('a[title]').tooltip({
					container: 'body'
				});
				$('.dropdown-menu input').click(function() {
					return false;
				})
				.change(function() {
					$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
				})
				.keydown('esc', function() {
					this.value = '';
					$(this).change();
				});
				$('[data-role=magic-overlay]').each(function() {
					var overlay = $(this),
					target = $(overlay.data('target'));
					overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
				});
				if ("onwebkitspeechchange" in document.createElement("input")) {
					var editorOffset = $('#editor').offset();
					$('#voiceBtn').css('position', 'absolute').offset({
						top: editorOffset.top,
						left: editorOffset.left + $('#editor').innerWidth() - 35
					});
				} else {
					$('#voiceBtn').hide();
				}
			};
			function showErrorAlert(reason, detail) {
				var msg = '';
				if (reason === 'unsupported-file-type') {
					msg = "Unsupported format " + detail;
				} else {
					console.log("error uploading file", reason, detail);
				}
				$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
					'<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
			};
			initToolbarBootstrapBindings();
			$('#editor').wysiwyg({
				fileUploadError: showErrorAlert
			});
			window.prettyPrint && prettyPrint();
		});
	</script>
	<script>
		var x = 0;
		$('#menu_toggle').click(function(){
			if (x === 0) {
		    	$('#menu_logo').attr('src', '../images/logo_white.png');
		    	$('#menu_logo').attr('style', 'width: 80%;');
		    	x = 1;
			} else {
				$('#menu_logo').attr('src', '../images/logo_white_.png');
		    	$('#menu_logo').attr('style', 'width: 60%;');
		    	x = 0;
			}
		});
	</script>
</c:if>
<c:if test="${user == null}">
	<br>
	<meta http-equiv="refresh" content="0; url=/isst_g09_ifactura" />
</c:if>