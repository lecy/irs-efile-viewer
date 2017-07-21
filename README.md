# IRS e-File Viewer

In June 2016, the [IRS released](https://aws.amazon.com/blogs/publicsector/irs-990-filing-data-now-available-as-an-aws-public-data-set/) over a million electronic 990 filings (nonprofit annual tax filings) as XML documents. These filings are accessible on [AWS](https://aws.amazon.com/public-datasets/irs-990/).

This utility allows users to visualize individual 990 XML filings in a format representing a standard IRS form.

![Form Transformation](img/xml_to_form.png)

## Project Structure
The IRS publishes stylesheets that can be used to transform an XML document into HTML. Specifically, these XSLT (eXtensible Stylesheet Language Transformation) files are distributed each year by the IRS so that tax preparers can generate tools that submit tax filings in the proper format. The [/mef](/mef) directory contains the full set of stylesheets provided by the IRS. However, since only the form 990s and related schedules are available, these are the only ones used by this utility.

Standard libraries exist to execute XML transformations; however, modern browsers are also able to execute these tranformations natively. Preventing the need for backend processing, all XML modifications and transformations are applied client-side in the browser. Thus, this utility is able to hosted as a static site.

This repository is configured as a Jekyll project in order to support the relative links that exist throughout the IRS stylesheets. These links need to be processed through Jekyll in order to route properly, so a number of the stylesheets have been modified to include Jekyll front matter and variables.

## Setup
**Dependencies**: git, Ruby, Bundler Rubygem

```
gem install bundler
cd /path/to/repository
bundle install
```

## Develop
`bundle exec jekyll serve --config _config.yml,_config.dev.yml --incremental`

## Compatibility
This application is designed to work on the most recent versions of major browsers (Chrome, Firefox, Safari, Edge), as well as IE11.

### Discusion on Compatibility

From my own research, browser compatibility is actually a little different than normal for this use case because the stylesheets will always generate the same HTML, regardless of which XSLT processing engine you're using. So compatibility is really driven by the JavaScript libraries that are available for executing the XML transformation (and any other manipulation you want to do). 

One-hundred percent compatibility is available in two ways: generating the HTML server-side or serving the raw XML to the browser and providing a stylesheet declaration at the top. It turns out that every browser can run an ad hoc transformation this way (see [this file](https://github.com/betson/irs-efile-viewer/blob/d4d1d1550e3fb343d08259266c0dde3b24f27702/demo990.xml) as an example I used to use). 

However, I ended up not going this approach because of browser cross-domain restrictions. If I generated the XML dynamically (because you have to manipulate a 990 filing to get it in the right format), I couldn't load the stylesheets that were being served from my domain. Instead I'd have needed to store a file on a server and serve it normally to get that approach to work. Though in the end, that would probably get in the way of search indexability because a crawler would see the raw XML as the source instead of the HTML transformation.

The stylesheets also aren't perfect. It looks like as the IRS made changes to update compatibility for newer browsers, they would apply those changes to the most recent tax year stylesheets, but the changes wouldn't necessarily get updated in the older stylesheets. 

I've manually made a few changes to 2013+ to make things look right, but the older years are still rendering oddly. My guess is they were built for IE6-8, but I haven't tested that for sure. 

You can see some of the stylesheet changes I made by searching "[stylesheet fix](https://github.com/betson/irs-efile-viewer/search?utf8=%E2%9C%93&q=%22stylesheet+fix%22&type=Commits)" in the github repository.
