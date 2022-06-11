from classes import ScraperAndReader as sar


def downloadAndTreat(Run):
    Run.downloadAndZip()
    Run.zipToDataFrame()
    Run.changeRows()
    Run.dataFrameToZipCsv()
    Run.deleteUnusable()
    print('FINISHED!')

Run = sar()
downloadAndTreat(Run)
