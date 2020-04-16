<%-- 
    Document   : admin_products
    Created on : Apr 10, 2020, 6:16:23 AM
    Author     : Family
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp">
    <jsp:param name="currentPage" value="customers"/>
</jsp:include>


      <!--Grid row-->
      <!--############################################################################-->
      <!--############################################################################-->
      <!--############################################################################-->
      <!--############################################################################-->
      <div class="row wow fadeIn">

        <!--Grid column-->
        <div class="col">

          <!--Card-->
          <div class="card">

            <!--Card content-->
            <div class="card-body">


              <div id="table" class="table-editable">
                <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
                      class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
                <table class="table table-bordered table-responsive-md table-striped text-center">
                  <thead>
                    <tr>
                      <th class="text-center">Person Name</th>
                      <th class="text-center">Age</th>
                      <th class="text-center">Company Name</th>
                      <th class="text-center">Country</th>
                      <th class="text-center">City</th>
                      <th class="text-center">Sort</th>
                      <th class="text-center">Remove</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="pt-3-half">Aurelia Vega</td>
                      <td class="pt-3-half" contenteditable="true">30</td>
                      <td class="pt-3-half" contenteditable="true">Deepends</td>
                      <td class="pt-3-half" contenteditable="true">Spain</td>
                      <td class="pt-3-half" contenteditable="true">Madrid</td>
                      <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-up"
                              aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-down"
                              aria-hidden="true"></i></a></span>
                      </td>
                      <td>
                        <span class="table-remove"><button type="button"
                            class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                      </td>
                    </tr>
                    <!-- This is our clonable table line -->
                    <tr>
                      <td class="pt-3-half" contenteditable="true">Guerra Cortez</td>
                      <td class="pt-3-half" contenteditable="true">45</td>
                      <td class="pt-3-half" contenteditable="true">Insectus</td>
                      <td class="pt-3-half" contenteditable="true">USA</td>
                      <td class="pt-3-half" contenteditable="true">San Francisco</td>
                      <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-up"
                              aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-down"
                              aria-hidden="true"></i></a></span>
                      </td>
                      <td>
                        <span class="table-remove"><button type="button"
                            class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                      </td>
                    </tr>
                    <!-- This is our clonable table line -->
                    <tr>
                      <td class="pt-3-half" contenteditable="true">Guadalupe House</td>
                      <td class="pt-3-half" contenteditable="true">26</td>
                      <td class="pt-3-half" contenteditable="true">Isotronic</td>
                      <td class="pt-3-half" contenteditable="true">Germany</td>
                      <td class="pt-3-half" contenteditable="true">Frankfurt am Main</td>
                      <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-up"
                              aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-down"
                              aria-hidden="true"></i></a></span>
                      </td>
                      <td>
                        <span class="table-remove"><button type="button"
                            class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                      </td>
                    </tr>
                    <!-- This is our clonable table line -->
                    <tr class="hide">
                      <td class="pt-3-half" contenteditable="true">Elisa Gallagher</td>
                      <td class="pt-3-half" contenteditable="true">31</td>
                      <td class="pt-3-half" contenteditable="true">Portica</td>
                      <td class="pt-3-half" contenteditable="true">United Kingdom</td>
                      <td class="pt-3-half" contenteditable="true">London</td>
                      <td class="pt-3-half">
                        <span class="table-up"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-up"
                              aria-hidden="true"></i></a></span>
                        <span class="table-down"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-down"
                              aria-hidden="true"></i></a></span>
                      </td>
                      <td>
                        <span class="table-remove"><button type="button"
                            class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
            </div>
          </div>
        </div>
        <!--/.Card-->

      </div>
      <!--##############################################################################-->
      <!--##############################################################################-->
      <!--##############################################################################-->
      <!--##############################################################################-->
      <!--##############################################################################-->
      <!--##############################################################################-->

      <%@include file="admin_footer.jsp" %>