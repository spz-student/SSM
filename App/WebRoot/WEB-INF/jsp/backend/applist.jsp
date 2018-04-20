<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					APP 信息管理维护 <i class="fa fa-user"></i><small>${devUserSession.devName}
						- 您可以通过搜索或者其他的筛选项对APP的信息进行修改、删除等管理操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="list">
					<input type="hidden" name="pageIndex" value="1" />
					<ul>
						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">软件名称</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="softwareName" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${appInfo.softwareName}">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">APP状态</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="status" class="form-control">
										<option value="${appInfo.status}">--请选择--</option>
										<c:forEach var="appType" items="${appTypes}">
											<c:choose>
												<c:when test="${appInfo.status==appType.valueId}">
													<option value="${appType.valueId}" selected="selected">
														${appType.valueName}
													</option>
												</c:when>
												<c:otherwise>
													<option value="${appType.valueId}">
														${appType.valueName}
													</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">所属平台</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="flatformId" class="form-control">
										<option value="${appInfo.flatformId}" selected="selected">--请选择--</option>
										<c:forEach var="appPlatform" items="${appPlatforms}">
											<c:choose>
												<c:when test="${appInfo.flatformId==appPlatform.valueId}">
													<option value="${appPlatform.valueId}" selected="selected">
														${appPlatform.valueName}
													</option>
												</c:when>
												<c:otherwise>
													<option value="${appPlatform.valueId}">
														${appPlatform.valueName}
													</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="categoryLevel1" id="queryCategoryLevel1"
										class="form-control">
										<option value="${appInfo.categoryLevel1}">--请选择--</option>
										<c:forEach var="categoryLevel1" items="${categoryLevel1s}">
											<c:choose>
												<c:when test="${appInfo.categoryLevel1==categoryLevel1.id}">
													<option value="${categoryLevel1.id}" selected="selected">
														${categoryLevel1.categoryName}
													</option>
												</c:when>
												<c:otherwise>
													<option value="${categoryLevel1.id}">
														${categoryLevel1.categoryName}
													</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="hidden" name="categorylevel2list"
										id="categorylevel2list" /> <select name="categoryLevel2"
										id="queryCategoryLevel2" class="form-control">
										<option value="${appInfo.categoryLevel2}">--请选择--</option>
										<c:forEach var="categoryLevel2" items="${categoryLevel2s}">
											<c:choose>
												<c:when test="${appInfo.categoryLevel2==categoryLevel2.id}">
													<option value="${categoryLevel2.id}" selected="selected">
														${categoryLevel2.categoryName}
													</option>
												</c:when>
												<c:otherwise>
													<option value="${categoryLevel2.id}">
														${categoryLevel2.categoryName}
													</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="categoryLevel3" id="queryCategoryLevel3"
										class="form-control">
										<option value="${appInfo.categoryLevel3}">--请选择--</option>
										<c:forEach var="categoryLevel3" items="${categoryLevel3s}">
											<c:choose>
												<c:when test="${appInfo.categoryLevel3==categoryLevel3.id}">
													<option value="${categoryLevel3.id}" selected="selected">
														${categoryLevel3.categoryName}
													</option>
												</c:when>
												<c:otherwise>
													<option value="${categoryLevel3.id}">
														${categoryLevel3.categoryName}
													</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
						</li>
						<li><button type="submit" class="btn btn-primary">查
								&nbsp;&nbsp;&nbsp;&nbsp;询</button></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_content">
				<p class="text-muted font-13 m-b-30"></p>
				<div id="datatable-responsive_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row">
						<div class="col-sm-12">
							<a
								href="${pageContext.request.contextPath}/dev/flatform/app/appinfoadd"
								class="btn btn-success btn-sm">新增APP基础信息</a>
							<table id="datatable-responsive"
								class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
								cellspacing="0" width="100%" role="grid"
								aria-describedby="datatable-responsive_info"
								style="width: 100%;">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="First name: activate to sort column descending"
											aria-sort="ascending">软件名称</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											APK名称</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											软件大小(单位:M)</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											所属平台</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											所属分类(一级分类、二级分类、三级分类)</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											状态</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											下载次数</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											最新版本号</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											style="width: 124px;"
											aria-label="Last name: activate to sort column ascending">
											操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="appInfo" items="${appInfos}" varStatus="status">
										<tr role="row" class="odd">
											<td tabindex="0" class="sorting_1">${appInfo.softwareName}</td>
											<td>${appInfo.APKName }</td>
											<td>${appInfo.softwareSize }</td>
											<td>${appInfo.flatformName }</td>
											<td>${appInfo.categoryLevel1Name }->
												${appInfo.categoryLevel2Name } ->
												${appInfo.categoryLevel3Name }</td>
											<td><span id="appInfoStatus${appInfo.id}">${appInfo.statusName }</span></td>
											<td>${appInfo.downloads }</td>
											<td>${appInfo.versionNo }</td>
											<td>
										<button type="button" class="btn btn-default checkApp" appinfoid="${appInfo.id }" versionid="${appInfo.versionId }" status="${appInfo.status }" 
											statusname="${appInfo.statusName }"											
											data-toggle="tooltip" data-placement="top" title="" data-original-title="查看并审核APP">审核</button>
										</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="dataTables_info" id="datatable-responsive_info"
								role="status" aria-live="polite">共${totalCount}条记录
								${currentPageNo}/${totalPageCount}页</div>
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers"
								id="datatable-responsive_paginate">
								<%-- <ul class="pagination">
									<c:if test="${currentPageNo > 1}">
										<li class="paginate_button previous">
											<a href="paging?softwareName=${appInfo.softwareName}&status=${appInfo.status}&flatformId=${appInfo.flatformId}&categoryLevel1=${appInfo.categoryLevel1}&categoryLevel2=${appInfo.categoryLevel2}&categoryLevel3=${appInfo.categoryLevel3}&devId=${appInfo.devId}&currentPageNo=1" aria-controls="datatable-responsive" data-dt-idx="0" tabindex="0">首页</a>
										</li>
										<li class="paginate_button ">
											<a href="paging?softwareName=${appInfo.softwareName}&status=${appInfo.status}&flatformId=${appInfo.flatformId}&categoryLevel1=${appInfo.categoryLevel1}&categoryLevel2=${appInfo.categoryLevel2}&categoryLevel3=${appInfo.categoryLevel3}&devId=${appInfo.devId}&currentPageNo=${totalPageCount-1}" aria-controls="datatable-responsive" data-dt-idx="1" tabindex="0">上一页</a>
										</li>
									</c:if>
									<c:if test="${currentPageNo < totalPageCount }">
										<li class="paginate_button ">
											<a href="paging?softwareName=${appInfo.softwareName}&status=${appInfo.status}&flatformId=${appInfo.flatformId}&categoryLevel1=${appInfo.categoryLevel1}&categoryLevel2=${appInfo.categoryLevel2}&categoryLevel3=${appInfo.categoryLevel3}&devId=${appInfo.devId}&currentPageNo=${currentPageNo+1}" aria-controls="datatable-responsive" data-dt-idx="1" tabindex="0">下一页</a>
										</li>
										<li class="paginate_button next">
											<a href="paging?softwareName=${appInfo.softwareName}&status=${appInfo.status}&flatformId=${appInfo.flatformId}&categoryLevel1=${appInfo.categoryLevel1}&categoryLevel2=${appInfo.categoryLevel2}&categoryLevel3=${appInfo.categoryLevel3}&devId=${appInfo.devId}&currentPageNo=${totalPageCount}" aria-controls="datatable-responsive" data-dt-idx="7" tabindex="0">最后一页</a>
										</li>
									</c:if>
								</ul> --%>
								<ul class="pagination">
									<c:if test="${currentPageNo > 1}">
										<li class="paginate_button previous"><a
											href="javascript:page_nav(document.forms[0],1);"
											aria-controls="datatable-responsive" data-dt-idx="0"
											tabindex="0">首页</a></li>
										<li class="paginate_button "><a
											href="javascript:page_nav(document.forms[0],${currentPageNo-1});"
											aria-controls="datatable-responsive" data-dt-idx="1"
											tabindex="0">上一页</a></li>
									</c:if>
									<c:if test="${currentPageNo < totalPageCount }">
										<li class="paginate_button "><a
											href="javascript:page_nav(document.forms[0],${currentPageNo+1});"
											aria-controls="datatable-responsive" data-dt-idx="1"
											tabindex="0">下一页</a></li>
										<li class="paginate_button next"><a
											href="javascript:page_nav(document.forms[0],${totalPageCount});"
											aria-controls="datatable-responsive" data-dt-idx="7"
											tabindex="0">最后一页</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<%@include file="common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
<script src="${pageContext.request.contextPath }/statics/localjs/applist.js"></script>