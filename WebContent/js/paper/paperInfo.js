$(document)
		.ready(
				function() {
					$(".update-paper-status")
							.click(
									function() {
										var paper_status = $(".paper_status")
												.val();
										if (paper_status == 0) {
											$(".paper-status-text").text("已发表");
											$(".paper_status").val(1);
											$("[name=update_ZKY]").val(1);
											$("[name=update_JCR]").val(1);
											$("[name=update_CCF]").val(1);
											$(".location-area").css("display",
													"block");
											$(
													".dl-horizontal.text-overflow.acc-num")
													.css("display", "block");

										} else {
											$(".paper-status-text").text("未发表");
											$(".paper_status").val(0);
											$("[name=update_ZKY]").val(0);
											$("[name=update_JCR]").val(0);
											$("[name=update_CCF]").val(0);
											$(".location-area").css("display",
													"none");
											$(
													".dl-horizontal.text-overflow.acc-num")
													.css("display", "none");
										}
									});
					$(".confirm-button")
							.click(
									function() {
										var paper_status = $(".paper_status")
												.val();
										if (paper_status == 0) {
											alert("您还未修改任何信息，请修改后再提交！");
											return false;
										} else {
											var paper_id = $("[name=paper_id]")
													.val();
											var paper_accNum = $(
													"[name=paper_accNum]")
													.val();
											if (paper_accNum == "") {
												alert("请填写检索编号！");
												return false;
											}
											var update_ZKY = $(
													"[name=update_ZKY]").val();
											var update_JCR = $(
													"[name=update_JCR]").val();
											var update_CCF = $(
													"[name=update_CCF]").val();
											var paper_location_ZKY, paper_location_JCR, paper_location_CCF;
											var confirm_update_ZKY_status = false;
											var confirm_update_JCR_status = false;
											var confirm_update_CCF_status = false;
											if (update_ZKY == 1) {
												var paper_location_issuing_ZKY = $(
														"[name=paper_location_issuing_ZKY]")
														.val();
												var paper_location_volume_ZKY = $(
														"[name=paper_location_volume_ZKY]")
														.val();
												var paper_location_pagination_ZKY = $(
														"[name=paper_location_pagination_ZKY]")
														.val();
												if (paper_location_issuing_ZKY == ""
														|| paper_location_volume_ZKY == ""
														|| paper_location_pagination_ZKY == "") {
													confirm_update_ZKY_status = true;
												}
												paper_location_ZKY = paper_location_issuing_ZKY
														+ '&'
														+ paper_location_volume_ZKY
														+ '&'
														+ paper_location_pagination_ZKY;
											}
											if (update_JCR == 1) {
												var paper_location_issuing_JCR = $(
														"[name=paper_location_issuing_JCR]")
														.val();
												var paper_location_volume_JCR = $(
														"[name=paper_location_volume_JCR]")
														.val();
												var paper_location_pagination_JCR = $(
														"[name=paper_location_pagination_JCR]")
														.val();
												if (paper_location_issuing_JCR == ""
														|| paper_location_volume_JCR == ""
														|| paper_location_pagination_JCR == "") {
													confirm_update_JCR_status = true;
												}
												paper_location_JCR = paper_location_issuing_JCR
														+ '&'
														+ paper_location_volume_JCR
														+ '&'
														+ paper_location_pagination_JCR;

											}
											if (update_CCF == 1) {
												var paper_location_issuing_CCF = $(
														"[name=paper_location_issuing_CCF]")
														.val();
												var paper_location_volume_CCF = $(
														"[name=paper_location_volume_CCF]")
														.val();
												var paper_location_pagination_CCF = $(
														"[name=paper_location_pagination_CCF]")
														.val();
												if (paper_location_issuing_CCF == ""
														|| paper_location_volume_CCF == ""
														|| paper_location_pagination_CCF == "") {
													confirm_update_CCF_status = true;
												}
												paper_location_CCF = paper_location_issuing_CCF
														+ '&'
														+ paper_location_volume_CCF
														+ '&'
														+ paper_location_pagination_CCF;
											}
											var data = {
												paper_id : paper_id,
												paper_status : 1,
												paper_accNum : paper_accNum,
												paper_location_ZKY : paper_location_ZKY,
												paper_location_JCR : paper_location_JCR,
												paper_location_CCF : paper_location_CCF
											};
											alert("123");
											alert(confirm_update_ZKY_status);
											if (confirm_update_ZKY_status
													|| confirm_update_JCR_status
													|| confirm_update_CCF_status) {
												if (confirm('还有相应的期刊信息未填写，提交后将无法修改信息，是否确认修改？'))
													updatePaper(data);
											} else {
												updatePaper(data);
											}
										}
									});
					var updatePaper = function(data) {
						$
								.ajax({
									url : "teacher/updatePaperById.do",
									type : 'POST',
									data : data,
									datatype : "json",
									success : function(result) {
										if (result == "success") {
											alert("修改论文成功！")
											window.location.href = "teacher/modifyPaper.do?paper_id="
													+ paper_id;
										}
										if (result == "error") {
											alert("修改论文失败，请重新尝试！");
										}
									},
									error : function(data) {
										alert("请求失败");
									}
								});

					}
				})