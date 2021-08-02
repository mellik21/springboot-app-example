<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">User Name:</label>
        <div class="col-sm-6">
            <input type="text" name="username" class="form-control" placeholder="User name..."/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Password..."/>
        </div>
    </div>
    <#if isRegisterForm>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="some@some.com"/>
        </div>
    </div>
    </#if>

    <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>

    <button class="btn btn-primary" type="submit">Sign In</button>
    <#if !isRegisterForm>
    <a href="/registration">Add new user</a>
</#if>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <button class="btn btn-primary"  type="submit">Sign Out</button>
    <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
</form>
</#macro>
