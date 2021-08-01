<#import "parts/common.ftl" as c>
<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main">
            <input type="text" class="form-control" name="filter" value="${filter?ifExists}"
                   placeholder="Search by tag">
            <button type="submit" class="btn btn-primary my-3">Search</button>
        </form>
    </div>
</div>
<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false">
    Add new message
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group my-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group my-3">
                <input type="text" class="form-control" name="text" placeholder="Введите сообщение...">
            </div>
            <div class="form-group my-3">
                <input type="text" class="form-control" name="tag" placeholder="Введите тэг">
            </div>
            <div class="form-group my-3">
                <div class="mb-3">
             <!--       <label for="formFile" class="form-label">Default file input example</label>-->
                    <input class="form-control" type="file" id="formFile" name="file">
                </div>
            </div>
            <div><input type="hidden" name="_csrf" value="${_csrf.token}"/></div>
            <div class="form-group my-3">
                <button class="btn btn-primary" type="submit">Добавить</button>
            </div>
        </form>
    </div>
</div>
<div class="card-columns">
    <#list messages as message>
    <div class="card m-3">

            <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
             </#if>

        <div class="m-2">
            <span>${message.text}</span>
            <i>${message.tag}</i>
        </div>

        <div class="card-footer text-muted">
            ${message.authorName}
        </div>

    </div>
    <#else>
    No messages
</#list>

</div>
</@c.page>