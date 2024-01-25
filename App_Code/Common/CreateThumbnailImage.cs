
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;


    public static class CreateThumbnailImage
    {
        public static Bitmap CreateThumbnail(string ImagePath, int ThumbnailWidth, int ThumbnailHeight)
        {
            System.Drawing.Bitmap Thumbnail = null;
            try
            {
                Bitmap ImageBMP = new Bitmap(ImagePath);
                ImageFormat loFormat = ImageBMP.RawFormat;

                decimal lengthRatio;
                int ThumbnailNewWidth = 0;
                int ThumbnailNewHeight = 0;
                decimal ThumbnailRatioWidth;
                decimal ThumbnailRatioHeight;

                // If the uploaded image is smaller than a thumbnail size the just return it
                if (ImageBMP.Width <= ThumbnailWidth && ImageBMP.Height <= ThumbnailHeight)
                    return ImageBMP;

                // Compute best ratio to scale entire image based on larger dimension.
                if (ImageBMP.Width > ImageBMP.Height)
                {
                    ThumbnailRatioWidth = (decimal)ThumbnailWidth / ImageBMP.Width;
                    ThumbnailRatioHeight = (decimal)ThumbnailHeight / ImageBMP.Height;
                    lengthRatio = Math.Min(ThumbnailRatioWidth, ThumbnailRatioHeight);
                    ThumbnailNewWidth = ThumbnailWidth;
                    decimal lengthTemp = ImageBMP.Height * lengthRatio;
                    ThumbnailNewHeight = (int)lengthTemp;
                }
                else
                {
                    ThumbnailRatioWidth = (decimal)ThumbnailWidth / ImageBMP.Width;
                    ThumbnailRatioHeight = (decimal)ThumbnailHeight / ImageBMP.Height;
                    lengthRatio = Math.Min(ThumbnailRatioWidth, ThumbnailRatioHeight);
                    ThumbnailNewHeight = ThumbnailHeight;
                    decimal lengthTemp = ImageBMP.Width * lengthRatio;
                    ThumbnailNewWidth = (int)lengthTemp;
                }
                Thumbnail = new Bitmap(ThumbnailNewWidth, ThumbnailNewHeight);
                Graphics g = Graphics.FromImage(Thumbnail);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.FillRectangle(Brushes.White, 0, 0, ThumbnailNewWidth, ThumbnailNewHeight);
                g.DrawImage(ImageBMP, 0, 0, ThumbnailNewWidth, ThumbnailNewHeight);

                ImageBMP.Dispose();
            }
            catch
            {
                return null;
            }

            return Thumbnail;
        }


        public static List<string> GetSchoolOffDayName(string StudyDays)
        {
            List<string> Offdays = new List<string>();
            List<string> Days = new List<string>();
            Days.Add("Monday");
            Days.Add("Tuesday");
            Days.Add("Wednesday");
            Days.Add("Thursday");
            Days.Add("Friday");
            Days.Add("Saturday");
            Days.Add("Sunday");
            if (!string.IsNullOrEmpty(StudyDays))
            {
                Offdays = Days.Where(x => !StudyDays.Split(',').Contains(x)).ToList();
            }

            return Offdays;
        }
        public static List<int> GetDayNumber(List<string> DaysName)
        {

            List<int> daylist = new List<int>();
            for (int i = 0; i < DaysName.Count; i++)
            {
                switch (DaysName[i])
                {
                    case "Monday":
                        daylist.Add(1);
                        break;
                    case "Tuesday":
                        daylist.Add(2);
                        break;
                    case "Wednesday":
                        daylist.Add(3);
                        break;
                    case "Thursday":
                        daylist.Add(4);
                        break;
                    case "Friday":
                        daylist.Add(5);
                        break;
                    case "Saturday":
                        daylist.Add(6);
                        break;
                    case "Sunday":
                        daylist.Add(0);
                        break;
                }
            }



            return daylist;
        }
    }
